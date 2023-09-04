Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEB9C83F33
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Sep 2023 11:14:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352696AbjIDLOu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Sep 2023 07:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352077AbjIDLOt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Sep 2023 07:14:49 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF761AD
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Sep 2023 04:14:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXiQYVCh0SUHo32UoDCb+3gv0jn/8N6zu62NRCyjLoS4H3UR4PtXhwsOdjWTzqRUZ+ixI2QNcfk/J4d7W83VW4G9MVdYLk9NUpNsJvLlG9qNVG2DRqiZq03cDfgEsSxsEvKFAuIa8JgDu3StKl/tNg2BFHa6OqTrRwHohPjZXJdFDx6K/PkBKIC2HGF81FFoUXCOy6AzgZFJ4QtHhy0qffnZFZP25tuNOQk9A7KS8gQUqv7TpCN9IHrSlInyfSNVU7AM5ZslSc+TjIg9MnQnXs6lKOgnYEE2NbHcEhWPYvAHGlVxqhOHVg4mxHbIAzL1vm7JmyJL0M0LDRj5Wc7J5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzQhzR6aL9/kaYY5U7P2y3YmdLYxj0DAxVCaJIDw+lk=;
 b=H4VjawtuDC1ZM/ghqaTRBDbAAdnCILSMfoKIf8MPorsWZn+2pJqtL0763lx4KlvoSo3i2uGHt/cAJuvqBJEplP+GH4YW8sICLdkkjIvGLQtBTn+lbJNBQe8SQUGoaqdUOKXM51LkciGEtqXMywt6qJStiRAKNnR6yZ/tCB6sxqh9+uVw0+brr3pjBSNG5CgUzU5KWF/X8H7n5v/zKv8QYsnrmsL+r/Ef3sa5r5lcPhWdtb76DMmTu4m4mueTpflE8gMSN6KzjAYC2i2ZH8/pjgSpt4JoYimLYxJPD5a1z004jYlvPjeSwz6SpndCHa4r7G3fBOFAOzKcw6CVS1HOHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzQhzR6aL9/kaYY5U7P2y3YmdLYxj0DAxVCaJIDw+lk=;
 b=toYT00OP4wpH/MK53h2d6WToRYwKEUnsbTxDhRe2I2exiwAepQ9HD0dglcGdwpLl+kooqfSW6IXGs1n/AM8vYyAw7dFt/PsPJlXe4pKbSHa/A9VItJPjyFyN34AVyoYP5w6Yn/+heX6esCRNPMLm1eVcnpX7Hn+eognRgBeCt4k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by LV8PR12MB9271.namprd12.prod.outlook.com (2603:10b6:408:1ff::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 11:14:42 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::2258:36a:b01d:eb0e]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::2258:36a:b01d:eb0e%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 11:14:42 +0000
Message-ID: <dd8f01d4-8b57-1470-b882-fba3c53c20a9@amd.com>
Date:   Mon, 4 Sep 2023 16:44:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/4] platform/x86/amd/hsmp: add support for metrics tbl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20230818125119.1323499-1-Suma.Hegde@amd.com>
 <20230818125119.1323499-3-Suma.Hegde@amd.com>
 <f6d62567-3efa-32cd-e9ea-f66455ccde9b@linux.intel.com>
Content-Language: en-US
From:   "Hegde, Suma" <Suma.Hegde@amd.com>
In-Reply-To: <f6d62567-3efa-32cd-e9ea-f66455ccde9b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::19) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|LV8PR12MB9271:EE_
X-MS-Office365-Filtering-Correlation-Id: 14eecd11-0d9f-42fe-f332-08dbad3822bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QA1YODfA3zJC2CDNGXYe3V5Wf60yNseA+NePjNglgi2IiO1sjsBA3Mnmvlz85zoaLenvlRntl/V9nSI/Wa7QgdK08nh6qiJhNcoLSGWTGLn4uCCr5detbx0yodfzQjh3+n5wMwXJjvpBSB+GMNf368MnuLoq2uOjPrz8T08RDUL+xzt0LRL1gBDcKQ2cm2w6YAnxn337n7m8wDSjG+UEzJAnoNQiik77tzUjrLgbhqNGkf4Zv5+40rCUf74qTwuHBQ4O46Qtg+Rd3NauEqrJqjRqirN7SopxVOKBYrHX+MJF4jwaStUci7ztUoY5gM8ng7Z3aixL7iEr5URMAfNTAZP5Ub5EcMnUM0y4HfAPubSeyS06fDksedCcYxCBUGkkajCM3l4eDr2Vtx0rWkOlnDeisgmleyvz6iawQf5g0DoKkORgh/8ZR5HOOLqJp66S/WsOn4Se8KoXRGMCR97bZuOE4d0OtvoC9K62T+qmM9HMotuM3MwXSfYdzeR0imLBBumPy3pyre0twqrbEzF4Vwysm/ARy1+9E6QSaDblgtGuYrL/Au8BmAx3Itn63PcycjAUWr2zQ2CP51UBV/T3VDH5TtdjhHSKlZ/Goeim+E21LGs40ZTH4riXe1Qi3HcMNjDbgiwCD76LEG4NB7pL8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(186009)(1800799009)(451199024)(41300700001)(6666004)(6506007)(6486002)(53546011)(478600001)(83380400001)(2616005)(26005)(6512007)(66574015)(38100700002)(6916009)(36756003)(66946007)(2906002)(66476007)(316002)(86362001)(31696002)(66556008)(31686004)(5660300002)(8936002)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmt5V0NuQThsMnpHVUdLU1I3U0IwNFMxRTF4K0lGUkNWMUV0cE10YjQ5UmJp?=
 =?utf-8?B?cFlaczFiWWVsZEtpZFZxZWFVNERsemV3MGx4MEczc3JkSld4NURBZjVDRjVR?=
 =?utf-8?B?LzNtWTNHRCtQbzAweGxaendENTcvSUhmdWNsbit5M01QTEo3b1RTWG0zU1NB?=
 =?utf-8?B?YVlpM3ErUndSUGhuMkpXdmFaMmtJMXlMMGVRb21uK2pmdjVJd2lLVXQ1NWVy?=
 =?utf-8?B?RVZnSHBVVFR4TnM0bDdidkc0TDcrUldjZHhpNkp5N01vWU9xUVBlak81bVZW?=
 =?utf-8?B?UENBVzRJK0YzT3VreklzYmllVmlURGJXSDZ0V0FvdWt6bDYwc3lZMGtVdzRY?=
 =?utf-8?B?enJ0SlZaQTNEb1NUVnBTRmI2clRLU21zU1BtUDFObXorQkRlTlp4eHlOYWhx?=
 =?utf-8?B?c2FRa1NWMWRKYm0zT1AveHRTUDY0YzhkNDQwSFdQcTVsZTRBS0pLMjdTc1Q3?=
 =?utf-8?B?MjZ6WEVBeGdKLzNESi9QUUdqa1NtUlFrbWE2dTEyQTNOVkxMR25SdEFadDho?=
 =?utf-8?B?ektaNStDVGRYWjlLMVlXYTBDMm5sNzRlQ1QzbTIwV3FNbWZmQ1hiNXo2NnRL?=
 =?utf-8?B?bnpKemY3dTc4eUNnTDMzR2JRMk5CclQrU2ZBU2lTK3pnYlJUOE52djJOZXFJ?=
 =?utf-8?B?TTlWclRoYzNBVkRZd2t3YXcralAwaG9NYk9idHJKOVRFai9iMVhmK2ZtTEV1?=
 =?utf-8?B?alJ3VDEybEJXRjJiOXZ5RW01RmdHVkdnNXhiZnB3TnBWdmU5WHRKOGZudml1?=
 =?utf-8?B?U05mN2JIVVRQbXJiVE1ZQU90V1NSWk5ZczhRRFJKaVNNTkVxdkVsY0Z6YWda?=
 =?utf-8?B?YVM4bFJQSnM1aTJ0SEJLRDd5R0pGQ1RrWmlHU1U0RmpFM2JRZGtVakFQb1B5?=
 =?utf-8?B?WnFjRllYamp1dUpyY3IwRHJmdzg0RTROUFE1VUg3QmpraXBXRFUwNlUwMis3?=
 =?utf-8?B?S2xTZmE3RkExd3pBcGUvSVFxTmFoTm9MOHA2TDlER0JlOWxLaUh6YkRsWFdu?=
 =?utf-8?B?cldSaFZ2MFlOUVc0M1RJajAyV1Y4cm1zTTV4V1FsdTJlbVRsK0JwS0crZWpD?=
 =?utf-8?B?ZGRUaW9aSzZNak1RMVcvenBPalQ5d3c2cE1rQ2cvenRpV1JnZFpCY0JJdkVH?=
 =?utf-8?B?aGV3Q2pMd21HWENZcWNaSERkUk1kOXBRcC9xM2wyeEpUNHJMRmQxZ1pMM242?=
 =?utf-8?B?WFJURVBqSVdiN1J0NW8rNHM1MWI1SGFpRVBITVVhTEF0elJDU1EyUm45RjFJ?=
 =?utf-8?B?VGJqUTN5Tlg3anBwMGYzL1pOU2IySWxCQ040U01hS3lvbUhRVzZpeXBHVnV6?=
 =?utf-8?B?d0hmMnRUTDBjTlJJSlNLdHZCN3BpckV1Mk9zcVlNNm8zSkIzWGZhcCtBNW0y?=
 =?utf-8?B?dk5RS2ZMYmhyb05uQ1FJUUlZOGNwYURNWWRlVUR0a1dHTE9SaWowRk9haTZB?=
 =?utf-8?B?QjhNVURuOXlJeFE1VUc1MzBFeFM2bHBxdXF2OEgxUEZkN3oxeXY3bVpqU0tm?=
 =?utf-8?B?WDVockZZVkZWdFJKZTNrdEMzR3dydVdtbDlwNkRGaldYS2dSY21ZeWpxeVlG?=
 =?utf-8?B?VUdIUklBancveGgxNk5ZcTFqZzVXUE01bWNOY3JZbDlhdzZwZ0JRdnFQSEx5?=
 =?utf-8?B?VDFrclBIb2lpbm1PVWFodFpJK0o4WEtYdFZVVGRJYTJsUzFEV1hHOFY2VzI3?=
 =?utf-8?B?WkZiVXFVTXVubUFqSW1pY1NIay9IK2NwTGxSZzMvOWwzWFFQNGltelVjYWQz?=
 =?utf-8?B?eUlqRUtieG9GTjNFc2ErNUgwRWxCMm93dlVscFFjanozdkJrMmVUeFpISkdL?=
 =?utf-8?B?di8wZmtSODB2bXRyZkJDaldHS0N2YTNyMDhZZW1sVWVjeDBLNEhVUHNYc2dP?=
 =?utf-8?B?R1J2UUlJeW5WM04zU3J4U3ZlOGw5RTlGaUJ0RCtrckJpQkFHRGdXMEc4VjNj?=
 =?utf-8?B?YzU4NDI3bFZ4WnV2Wi9QTFMzL1diSXBzT3lQSysvTm1zenpncWFnQmtjYmw0?=
 =?utf-8?B?aTdBdEo3eVBEdFBHVVlQQ0sxbk43YzJ0cUxKVnF2bWs0WE1LTC9DZ3ZNUUZL?=
 =?utf-8?B?dG4ySWhrc3FEamUvcDUxOEVnZjJMT3NpRlVoTGVkVXlIaWFCTlNlWXRySFdU?=
 =?utf-8?Q?wyOSuATUvgWjiHCvar9nQUaui?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14eecd11-0d9f-42fe-f332-08dbad3822bf
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 11:14:41.9352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNCyZOVT4dYa2gGZe7WL6SHMNSkdvlIbQheFqey7HnI3G3nMm09PLAbIkhFGtInLvudJSDmySSw+PS2VvAK32g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9271
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Ilpo Jarvinen,

Thanks for the suggestions.

On 8/22/2023 2:27 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Fri, 18 Aug 2023, Suma Hegde wrote:
>
>> From: Suma Hegde <suma.hegde@amd.com>
>>
>> AMD MI300 MCM provides GET_METRICS_TABLE message with which
>> all the system management information from SMU can be retrieved in just
>> one message.
>>
>> The metrics table is available as hexadecimal sysfs binary file in
>> /sys/devices/platform/amd_hsmp/socket%d_metrics_bin
>> Metrics table definitions will be documented as part of PPR which
>> available in public domain. The same is defined in the amd_hsmp.h header
>> file as well.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>> ---
>> +#define HSMP_ATRR_NAME_SIZE 25
>> +static int hsmp_create_metric_tbl_sysfs_file(int sock_ind)
>> +{
>> +     struct bin_attribute *hattr = &plat_dev.sock[sock_ind].hsmp_attr;
>> +     char *name;
>> +
>> +     sysfs_attr_init(&plat_dev.sock[sock_ind].hsmp_attr);
>> +     name = devm_kzalloc(plat_dev.dev, HSMP_ATRR_NAME_SIZE, GFP_KERNEL);
>> +     if (!name)
>> +             return -ENOMEM;
>> +     sprintf(name, "socket%d_metrics_bin", sock_ind);
> The structure would be more future-proof if you do socket%d/metrics_bin
> instead. Are you expected to add at some point in the future more files
> which are socket specific?
>
> You didn't provide any documentation for this interface btw, you should
> add it.

We are not expecting any new socket files right now, but in future we 
might create files for some more socket specific info.

So I will add directories for sockets and then will create files.

I will update documentation too.

>> +     hattr->attr.name        = name;
>> +     hattr->attr.mode        = 0444;
>> +     hattr->read             = hsmp_metric_tbl_read;
>> +     hattr->size             = sizeof(struct hsmp_metric_table);
>> +     hattr->private          = &plat_dev.sock[sock_ind];
>> +
>> +     return device_create_bin_file(plat_dev.dev, hattr);
>> +}
>> +static int hsmp_create_sysfs_file(void)
>> +{
>> +     int ret, i;
>> +
>> +     for (i = 0; i < num_sockets; i++) {
>> +             ret = hsmp_get_tbl_dram_base(i);
>> +             if (ret)
>> +                     goto cleanup;
>> +
>> +             ret = hsmp_create_metric_tbl_sysfs_file(i);
>> +             if (ret) {
>> +                     dev_err(plat_dev.dev, "Unable to create sysfs file for metric table\n");
>> +                     goto cleanup;
>> +             }
>> +     }
>> +
>> +     return 0;
>> +
>> +cleanup:
>> +     while (i > 0)
>> +             device_remove_bin_file(plat_dev.dev, &plat_dev.sock[--i].hsmp_attr);
>> +     return ret;
>> +}
>> +
>> +static int hsmp_cache_proto_ver(void)
>> +{
>> +     struct hsmp_message msg = { 0 };
>> +     int ret;
>> +
>> +     msg.msg_id      = HSMP_GET_PROTO_VER;
>> +     msg.sock_ind    = 0;
>> +     msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
>> +
>> +     ret = hsmp_send_message(&msg);
>> +     if (!ret)
>> +             plat_dev.proto_ver = msg.args[0];
>> +
>> +     return ret;
>> +}
>> +
>>   static int hsmp_pltdrv_probe(struct platform_device *pdev)
>>   {
>> -     int i;
>> +     int ret, i;
>>
>>        plat_dev.sock = devm_kzalloc(&pdev->dev,
>>                                     (num_sockets * sizeof(struct hsmp_socket)),
>> @@ -344,18 +463,44 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>>                plat_dev.sock[i].sock_ind = i;
>>        }
>>
>> -     plat_dev.hsmp_device.name       = "hsmp_cdev";
>> +     plat_dev.hsmp_device.name       = HSMP_CDEV_NAME;
>>        plat_dev.hsmp_device.minor      = MISC_DYNAMIC_MINOR;
>>        plat_dev.hsmp_device.fops       = &hsmp_fops;
>>        plat_dev.hsmp_device.parent     = &pdev->dev;
>> -     plat_dev.hsmp_device.nodename   = "hsmp";
>> +     plat_dev.hsmp_device.nodename   = HSMP_DEVNODE_NAME;
>>        plat_dev.hsmp_device.mode       = 0644;
>>
>> -     return misc_register(&plat_dev.hsmp_device);
>> +     ret = misc_register(&plat_dev.hsmp_device);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = hsmp_cache_proto_ver();
>> +     if (ret) {
>> +             dev_err(plat_dev.dev, "Failed to read HSMP protocol version\n");
>> +             goto cleanup;
>> +     }
>> +
>> +     /* metrics table is supported only from proto ver6 EPYCs */
>> +     if (plat_dev.proto_ver >= HSMP_PROTO_VER6) {
>> +             ret = hsmp_create_sysfs_file();
> For new things, driver/device attribute_group should be used where
> possible. .is_visible() can handle that condition check for you.

Ok, will do the required modification.


> --
>   i.

Thank you,

Suma

