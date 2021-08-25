Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C00DC432BE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 16:48:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81F3D60F42
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 16:48:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhHYQsu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Aug 2021 12:48:50 -0400
Received: from mail-mw2nam12on2080.outbound.protection.outlook.com ([40.107.244.80]:63041
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232606AbhHYQst (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Aug 2021 12:48:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PK9s/XWk3azT9s4BUTNx0UrYdm9zcAoRcsWiTkdxrqfHBJHVcYJGBMU0lh4oCLKbSb1FCC090nU4rfo8BS6NSDk1umPMXoFXWgxVxH07maxO5vWNJZfKiU3Pr+4+SMNVQE6VTCd+Ba9bnhx/qZ+03AIG/JnboJI1BEGV78XQ876HDdFwvWSx8NBhQKUfYm7GnH55ljnzjNnwz4sOwJTECLddTr/ekKGf0eisyZ9/liAcDxdfNseCRohRMoo7OBY/n4QjiCqExKNhIUiY/Tqvbke0NoFKlONHM7LtYPN2Pyk4u9qpIAVgam/UUWNBOWK7h67LtpqZQFijCWdH0iGX+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iD7fjeORZBFoOi3mfg30QLZleFXeNN0Cyi5QxQquBm4=;
 b=REpb5mUqhcbuKvdhSp3QdvAyHSeC7yJgxoZV8zL1PjdabHaluAcGpoMhxuja3NmnsZOb1mdyczbnwW4HzFfT1rxgA7ynFmhAzL1IRgW10zXTRz98lA8Y9lOQ6uh1HM3T5uvNmaquy+2OoQmIbfx0/GQ4DiBGQYTEteAyiVxGBW8tuMz4VBRV6EFznYwbjD8IO9/5Nc2MvVc1rAjvoLaoWo2hy487vujKCn+m4cU5vwvQLNsf+RR9kJz5qr1oF6b9j62RXwQdTr6FAVHUmOo62GgqvjkSQW0rKutcnfz3XFJatbqy44tyVR1cGL6qVV9zjTuLK+1JhJK39Gmuas6IQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iD7fjeORZBFoOi3mfg30QLZleFXeNN0Cyi5QxQquBm4=;
 b=mmpnwMVDx9LYcbStFZ6QN7gHxj0gOP3cpuxfDScHWQJg5J/O/8pYZUzv3FAMCLHd6jx+jn0OA6vUOtzyUhcT+JPy7kVjy8z31osUU1I8p27kkq+iRdPP384DMjViGWZLibs4Mp+pqeX9HFEb6rclKKWXkcOdmuL4Qz/jkGlA3szdEYQ3ZT8SvsdWQr4uYDj1GZ2d8mC1VqBGKZtBfmUS/ATD+Jb5+T9nrX7t3bL3kUBXm5Dt6e6O0JLv1+HHZb6Ml5WPjnawOQwl6ucouG0RhJ7y7fyQaW4BvfNzsS4HeES8pazK5FSz14+alUc60lAu7JMy6m8gkb8FcRu4rjHbGQ==
Received: from DM6PR03CA0042.namprd03.prod.outlook.com (2603:10b6:5:100::19)
 by CH0PR12MB5073.namprd12.prod.outlook.com (2603:10b6:610:e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 16:48:00 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::6f) by DM6PR03CA0042.outlook.office365.com
 (2603:10b6:5:100::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 16:48:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 16:48:00 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 16:47:59 +0000
Received: from [10.20.22.215] (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 16:47:58 +0000
Subject: Re: [PATCH v3] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        <mario.limonciello@outlook.com>, <pobrn@protonmail.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Aaron Plattner <aplattner@nvidia.com>
References: <877ae34b-dcbb-a0a4-7d76-d9d78d12fd00@redhat.com>
 <20210824220437.14175-1-ddadap@nvidia.com>
 <CAHp75VfjSrq7vF=ry1dTHJWbKLF9AqK8kZbddO-1A3FQ5pCvhQ@mail.gmail.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <b22b0882-e54c-3168-2cbd-842f2ba51c90@nvidia.com>
Date:   Wed, 25 Aug 2021 11:47:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfjSrq7vF=ry1dTHJWbKLF9AqK8kZbddO-1A3FQ5pCvhQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2b3087d-a7fc-4dd4-2502-08d967e8193f
X-MS-TrafficTypeDiagnostic: CH0PR12MB5073:
X-Microsoft-Antispam-PRVS: <CH0PR12MB5073CA4C72DFBA475A8585C4BCC69@CH0PR12MB5073.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HvQIfTCD4VAzw9O4XleWAVYNK7Qn03wA8RNmOXrN0R5hLKddLrFbCmAxm6OO4Mj/xN0F/OFzkIAxz7KkGiI8RDdtBA33hV7MkumFgVMp59ybK1CEZDJGHvKeDN8hbpFlVKEP5bg3rzpW+ayR6+cRf61DdtIIQ7CcHpFwikSGjbmAr38yvp+B530A/B47IisMKctCGR+RjS5LfEr41U3s3ry8X0FbxShedrQB8BjTnlMYLRdFRZjStGsJkjPHSwYk0rkCQw2TYIodMDEJ2nzDieb8FQMgYh39Kvw7c7VS1QBvAKengFiJE5QpefiTkE+LtMPXvk2VhuIqyl3CMjqPtQ0MrAZsES86CrZmZ/aEQ6V0JESWPSWXi88+4LMTH/7C3rIoH5P7Y7vPRx8hMn9ZkNw2Sbcmo/qoCbxUmwX0DCgdSt/vgHFpkeYD5TEz9wzE8mdbymxp8aabR3kJH4/Ucr7Bwmk2WNzkG1z5JJu7RKaZynZcXz6PtIrMAT92sDuvVVeVlJcM0BHXzuzf1XrldJBxbC1Eh75TxwSwu/32bymowWkMpfPHTo9bBXg7AwI3iKHvJchq6X145BeFpVdstu+u6OrDN/reRNfEAO+YjCERlYgwj/rb0iJcctGxYcZh9NF2rCXyoF+1vzgDmgU8Wxj1mrj7rhAekHvnBGiK6+GU0lcIB3QlWCDs+myILe0WNbqODXXCIBSXHVg1eoHYvLS/TkKYX1vV2unXrV9TS1E=
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(36840700001)(16576012)(356005)(54906003)(478600001)(316002)(70586007)(336012)(7636003)(70206006)(8936002)(36906005)(426003)(8676002)(31696002)(86362001)(5660300002)(6916009)(4326008)(16526019)(2616005)(31686004)(32650700002)(83380400001)(36860700001)(82740400003)(2906002)(36756003)(186003)(107886003)(82310400003)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 16:48:00.2138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b3087d-a7fc-4dd4-2502-08d967e8193f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5073
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks again:

On 8/25/21 4:05 AM, Andy Shevchenko wrote:
> On Wed, Aug 25, 2021 at 1:09 AM Daniel Dadap <ddadap@nvidia.com> wrote:
>> A number of upcoming notebook computer designs drive the internal
>> display panel's backlight PWM through the Embedded Controller (EC).
>> This EC-based backlight control can be plumbed through to an ACPI
>> "WMAA" method interface, which in turn can be wrapped by WMI with
>> the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.
>>
>> Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
>> backlight class driver to control backlight levels on systems with
>> EC-driven backlights.
> I tried to avoid repetition of the comments given by others.
>
> So, mine below.
>
> ...
>
>> +config WMAA_BACKLIGHT_WMI
>> +       tristate "ACPI WMAA Backlight Driver"
>> +       depends on ACPI_WMI
>> +       depends on BACKLIGHT_CLASS_DEVICE
>> +       help
>> +         This driver provides a sysfs backlight interface for notebook
>> +         systems which expose the WMAA ACPI method and an associated WMI
>> +         wrapper to drive LCD backlight levels through the system's
>> +         Embedded Controller.
> Please, add a sentence to tell how the module will be called. There
> are plenty of examples in the kernel.
>
> ...
>
>> +struct wmaa_args {
>> +       u32 set;
>> +       u32 val;
>> +       u32 ret;
>> +       u32 ignored[3];
>> +};
> I guess this structure deserves a kernel doc.


Do you have a recommended location? From a quick skim I didn't see any 
document in Documentation/ that seemed most appropriate to add this to.


>
> ...
>
>> +static const struct wmi_device_id wmaa_backlight_wmi_id_table[] = {
>> +       { .guid_string = WMAA_WMI_GUID },
>> +       { },
> No comma for termination.
>
>> +};
> ...
>
>> +static int wmaa_backlight_get_brightness(struct backlight_device *bd)
>> +{
>> +       u32 level;
>> +       int ret;
>> +
>> +       ret = wmaa_get_brightness(&level);
>> +       WARN_ON(ret != 0);
> Why?


To differentiate a 0 because the level is actually 0 versus a 0 because 
there was an error. The backlight device API doesn't seem to have a way 
to report errors.


>> +       return ret == 0 ? level : 0;
>> +}
> ...
>
>> +static int wmaa_backlight_wmi_probe(struct wmi_device *w, const void *ctx)
>> +{
>> +       struct backlight_properties props = {0};
> {} is slightly better.
>
>> +       struct wmi_wmaa_priv *priv;
>> +       u32 source;
>> +       int ret;
>> +
>> +       priv = devm_kmalloc(&w->dev, sizeof(*priv), GFP_KERNEL);
>> +       if(!priv)
>> +               return -ENOMEM;
>> +       wdev = w;
> I'm wondering if it's possible to avoid having a global variable.


It is; this can be stored in the struct backlight_device.


>
>> +       ret = wmaa_get_brightness_source(&source);
>> +       if (ret)
>> +               goto done;
>> +
>> +       if (source != WMAA_SOURCE_EC) {
>> +               ret = -ENODEV;
>> +               goto done;
>> +       }
>> +
>> +       // Register a backlight handler
>> +       props.type = BACKLIGHT_PLATFORM;
>> +       ret = wmaa_get_max_brightness(&props.max_brightness);
>> +       if (ret)
>> +               goto done;
>> +
>> +       ret = wmaa_get_brightness(&props.brightness);
>> +       if (ret)
>> +               goto done;
>> +
>> +       priv->backlight = backlight_device_register("wmaa_backlight",
>> +               NULL, NULL, &wmaa_backlight_ops, &props);
>> +       if (IS_ERR(priv->backlight))
>> +               return PTR_ERR(priv->backlight);
>> +
>> +       dev_set_drvdata(&w->dev, priv);
>> +done:
> Useless. Return directly.


Yeah, most likely there used to be some other cleanup here. Thanks.


>
>> +       return ret;
>> +}
> ...
>
>> +static struct wmi_driver wmaa_backlight_wmi_driver = {
>> +       .driver = {
>> +               .name = "wmaa-backlight",
>> +       },
>> +       .probe = wmaa_backlight_wmi_probe,
>> +       .remove = wmaa_backlight_wmi_remove,
>> +       .id_table = wmaa_backlight_wmi_id_table,
>> +};
>> +
> Redundant blank line.
>
>> +module_wmi_driver(wmaa_backlight_wmi_driver);
> ...
>
>> +
>> +MODULE_ALIAS("wmi:"WMAA_WMI_GUID);
> Can you move this closer to GUID? But I'm not sure what is the
> preferred style. Hans?


I'll do whatever is most stylistically preferred.

