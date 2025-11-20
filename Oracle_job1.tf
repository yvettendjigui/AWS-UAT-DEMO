resource "aws_dms_endpoint" "source_endpoint_job_4" {

    endpoint_id         = "${local.project_name}-${local.product_name}-${var.env_name}-job-4-source"
    endpoint_type       = "source"
    engine_name         = "oracle"
    username            = local.source_username
    password            = data.aws_ssm_parameter.source_password.value
    server_name         = local.source_server_name
    port                = local.source_db_port
    database_name       = "micaprd.dpscs.ad.icj.mdstate"
}


resource "aws_dms_endpoint" "destination_endpoint_job_4" {

    endpoint_id         = "${local.project_name}-${local.product_name}-${var.env_name}-job-4-destination"
    endpoint_type       = "target"
    engine_name         = "oracle"
    username            = local.destination_username
    password            = data.aws_ssm_parameter.destination_password.value
    server_name         = local.destination_server_name
    port                = local.destination_db_port
    database_name       = "ORCL"
}

# migration task

resource "aws_dms_replication_task" "prod-dryrun-case-note-and-other-tables-load" {
    replication_task_id = "${local.project_name}-${local.product_name}-${var.env_name}-job-4"
    migration_type      = "full-load-and-cdc"
    source_endpoint_arn = aws_dms_endpoint.source_endpoint_job_4.endpoint_arn
    target_endpoint_arn = aws_dms_endpoint.destination_endpoint_job_4.endpoint_arn
    replication_instance_arn = aws_dms_replication_instance.dms_migration_instance.replication_instance_arn
    
    table_mappings = jsonencode({
        "rules" = [
                              {
                        "rule-id": 1740150685,
                        "rule-name": "md7kzv78-1ivfga",
                        "rule-type": "selection",
                        "rule-action": "include",
                        "object-locator": {
                            "schema-name": "MICASE",
                            "table-name": "CASE_NOTE"
                        },
                        "filters": []
                    },
                    {
                        "rule-id": 1411749743,
                        "rule-name": "md7skim3-hm1a4c",
                        "rule-type": "selection",
                        "rule-action": "include",
                        "object-locator": {
                            "schema-name": "MICASE",
                            "table-name": "DPP_INVESTIGATION_CRIM_HIST"
                        },
                        "filters": []
                    },
                    {
                        "rule-id": 1571189586,
                        "rule-name": "md7sm7zh-q9brqu",
                        "rule-type": "selection",
                        "rule-action": "include",
                        "object-locator": {
                            "schema-name": "MICASE",
                            "table-name": "DOC_RELEASE_ACTIVITIES"
                        },
                        "filters": []
                    },
                    {
                        "rule-id": 1615232677,
                        "rule-name": "md7smozx-gtjcfq",
                        "rule-type": "selection",
                        "rule-action": "include",
                        "object-locator": {
                            "schema-name": "MICASE",
                            "table-name": "DOC_VISIT"
                        },
                        "filters": []
                    },
                    {
                        "rule-id": 1632165288,
                        "rule-name": "md7smvt2-f3cmy6",
                        "rule-type": "selection",
                        "rule-action": "include",
                        "object-locator": {
                            "schema-name": "MICASE",
                            "table-name": "DOC_VISITOR_DETAIL"
                        },
                        "filters": []
                    },
                    {
                        "rule-id": 1662355668,
                        "rule-name": "md7sn77x-bh07z5",
                        "rule-type": "selection",
                        "rule-action": "include",
                        "object-locator": {
                            "schema-name": "MICASE",
                            "table-name": "DOC_PROGRAM_FACILITY"
                        },
                        "filters": []
                    },
                    {
                        "rule-id": 1671098760,
                        "rule-name": "md7snat9-4h0uch",
                        "rule-type": "selection",
                        "rule-action": "include",
                        "object-locator": {
                            "schema-name": "MICASE",
                            "table-name": "DOC_EPISODE"
                        },
                        "filters": []
                    },
                    {
                        "rule-id": 1683568586,
                        "rule-name": "md7snffx-7uy7cy",
                        "rule-type": "selection",
                        "rule-action": "include",
                        "object-locator": {
                            "schema-name": "MICASE",
                            "table-name": "DPP_EPISODE"
                        },
                        "filters": []
                    },
                    {
                        "rule-id": 1693235411,
                        "rule-name": "md7snj1b-0r4s0v",
                        "rule-type": "selection",
                        "rule-action": "include",
                        "object-locator": {
                            "schema-name": "MICASE",
                            "table-name": "DOC_PR_COMMENTS"
                        },
                        "filters": []
                    },
                    {
                        "rule-id": 1701765615,
                        "rule-name": "md7snmfu-n37p1v",
                        "rule-type": "selection",
                        "rule-action": "include",
                        "object-locator": {
                            "schema-name": "MICASE",
                            "table-name": "DOC_PR_PROGRAM"
                        },
                        "filters": []
                    },
                    {
                        "rule-id": 1709489225,
                        "rule-name": "md7snplj-hw0dag",
                        "rule-type": "selection",
                        "rule-action": "include",
                        "object-locator": {
                            "schema-name": "MICASE",
                            "table-name": "DOC_PR_CYCLE_FACILITY"
                        },
                        "filters": []
                    },
                    {
                        "rule-id": 1718908172,
                        "rule-name": "md7snsxa-k1ik34",
                        "rule-type": "selection",
                        "rule-action": "include",
                        "object-locator": {
                            "schema-name": "MICASE",
                            "table-name": "DOC_PR_CYCLE"
                        },
                        "filters": []
                    },
                    {
                        "rule-id": 2071041509,
                        "rule-name": "md7srl48-vf1p1v",
                        "rule-type": "selection",
                        "rule-action": "include",
                        "object-locator": {
                            "schema-name": "MICASE",
                            "table-name": "XX_DJC_RUN_CTRL"
                        },
                        "filters": []
                    },
                    {
                        "rule-id": 2092159578,
                        "rule-name": "md7srsyb-6sqlbj",
                        "rule-type": "selection",
                        "rule-action": "include",
                        "object-locator": {
                            "schema-name": "MICASE",
                            "table-name": "RELEASE_EXPIRED_INMATES_UPDAT"
                        },
                        "filters": []
                    },
                    {
                        "rule-id": 2099642286,
                        "rule-name": "md7srvvw-80hupq",
                        "rule-type": "selection",
                        "rule-action": "include",
                        "object-locator": {
                            "schema-name": "MICASE",
                            "table-name": "MEA_USERS"
                        },
                        "filters": []
                    },
                    {
                        "rule-id": 2106532255,
                        "rule-name": "md7sryny-29gq3u",
                        "rule-type": "selection",
                        "rule-action": "include",
                        "object-locator": {
                            "schema-name": "MICASE",
                            "table-name": "MEA_AUDIT_ID_TRACKER"
                        },
                        "filters": []
                    }
        ]
    })
    
       replication_task_settings  = jsonencode({
      destinationMetadata = {
        SupportLobs         = true
        FullLobMode         = false
        LimitedSizeLobMode  = true,
        LobMaxSize          = 50000 
      },
      FullLoadSettings = {
        MaxFullLoadSubTasks = 1,
        CommitRate = 1000
      }
      StreamBufferSettings = {
        StreamBufferCount = 3
        CtrlStreamBufferSizeInMB = 5
        StreamBufferSizeInMB = 8
        TargetTablePrepMode = "TRUNCATE_BEFORE_LOAD"
      }
      TargetMetadata = {
        TargetSchema = "MICASE"
        LobMaxSize = 5000
        BatchApplyEnabled = true
      }

    })
}
