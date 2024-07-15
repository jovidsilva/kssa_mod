
kssa_plot <- function(results, # results object from apply kssa function
                      type, # complete or summary
                      metric # if type == complete put any metric like rmse, cor, mase, smape
) {
  # First condition with kssa.object
  if (is(results[[1]],"kssa.table") & is(results[[2]],"kssa.table")) {

    # Extract complete data from kssa.tables object
    plot1 <- data.frame(
      "start_methods" = results[[1]]$start_methods,
      "actual_methods" = results[[1]]$actual_methods,
      "rmse" = results[[1]]$rmse,
      "cor" = results[[1]]$cor,
      "mase" = results[[1]]$mase,
      "smape" = results[[1]]$smape
    )

    # Extract summary information from kssa.table objects
    plot2 <- data.frame(
      "start_methods" = results[[2]]$start_methods,
      "actual_methods" = results[[2]]$actual_methods,
      "mean_rmse" = results[[2]]$mean_rmse,
      "std_rmse" = results[[2]]$std_rmse,
      "mean_cor" = results[[2]]$mean_cor,
      "std_cor" = results[[2]]$std_cor,
      "mean_mase" = results[[2]]$mean_mase,
      "std_mase" = results[[2]]$std_mase,
      "mean_smape" = results[[2]]$mean_smape,
      "std_smape" = results[[2]]$std_smape
    )

    # Generates list of metrics
    list_of_metrics <- c("rmse", "cor", "mase", "smape")

    # Get check for validation process
    check <- metric %in% list_of_metrics


    # Process validation and if all clear, ---> Plot
    if (type == "complete") {
      if (all(check) == TRUE) {
        plot <- ggplot(data = plot1, aes(x = stats::reorder(.data$actual_methods, eval(parse(text = metric))), y = eval(parse(text = metric)), fill = .data$start_methods)) +
          geom_boxplot() +
          labs(title = "Complete plot", x = "Actual methods", y = casefold(metric), fill = "Start methods") +
          theme_classic()
      }
      else {
        print('metric must be "rmse","cor", "mase" or "smape".
             Otherwise please check the defined metrics when run kssa')
      }
    }
    else if (type == "summary") {
      if (all(check) == TRUE) {
        plot <- ggplot(data = plot2, aes(x = stats::reorder(.data$actual_methods, eval(parse(text = paste0("mean_", metric)))), y = eval(parse(text = paste0("mean_", metric))), fill = .data$start_methods)) +
          geom_bar(
            stat = "identity", color = "black",
            position = position_dodge()
          ) +
          geom_errorbar(aes(
            ymin = eval(parse(text = paste0("mean_", metric))) - eval(parse(text = paste0("std_", metric))),
            ymax = eval(parse(text = paste0("mean_", metric))) + eval(parse(text = paste0("std_", metric)))
          ),
          width = .2,
          position = position_dodge(.9)
          ) +
          labs(title = "Summary plot", x = "Actual methods", y = casefold(metric)) +
          theme_classic()
      }
      else {
        print('metric must be "rmse","cor", "mase" or "smape".
             Otherwise please check the defined metrics when run kssa')
      }
    }
    else {
      print('type must be "complete" or "summary"')
    }
  }
  else {
    print("Error: data must be a kssa.table object")
  }
  return(plot)
} # End of code
