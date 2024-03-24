

MetricFlow uses a timespine table to construct cumulative metrics. By default, MetricFlow expects the timespine table to be named metricflow_time_spine and doesn't support using a different name.

To create this table, you need to create a model in your dbt project called metricflow_time_spine and add the following code: