Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6541EC432BE
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 02:37:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E47C60200
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 02:37:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242987AbhIBCiG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Sep 2021 22:38:06 -0400
Received: from mail-dm6nam12on2046.outbound.protection.outlook.com ([40.107.243.46]:63328
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233145AbhIBCiF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Sep 2021 22:38:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCQu4EF2WwIwJyoiY9e9Y/q9pkDLZvg/0GeLmhKzfd6iw0eShp0+sXlI7UKM3IyiF6wK6fpyusl6vE7w4WamtBT7LLg8owUmVRajV5G3HPtT4JsWrkWhck7rBCUPFEUzMxgNU0iVIPocGEacjqu1waIuzflCsFxXjwhhdQoIes2c1XCPlJb2CuKTRYLHk1P1JQeQTvG2Kt7FcCvmlSd6uCPksKW22QTnL4j5mxaKAjRXNEvO5j9RXFG0hNzGCww0mCkgrm7hl9QwmrEEQLKpSwzjuD5Tvojgny5KqzitIBoG6KqJI01zL/7CTi0zG7eaCcuDJAxE1/IzxnLECpB2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBQO/z3wpmMvvDjXbkUih4hyfTMVW0y6jlu0qZxxzR4=;
 b=UMzj0+FGg51y33G5G2ZOSUxpqhLq1XYEmZqsDDd4wAf9mL59DxgDv91bnffrIp+Ih1UDnSg0wREmusyiBL2r05TSu4PIk1P9Ij4mmR70cSNjtAJoet3ii7aqJakciXfFjkahJEY0ZgLN/j0wUpaYFZDdeh5g58nSspnnyDVbafpAn0Yvsx3bJOY8cN87inzj3fUvsD0Zw9QpYi5y2jk6Ize46VVhjcCdqhN/AbDsZvKH56k2393U2b2uJvu69UXDeyEV/4/laa0s74XmwTb0SSIxjbingPnMqQnRbm2KAsv8cWwZ7A+XTxQdUy6nxW++4pnECwl+dVl6APIwhsXItw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=t-8ch.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBQO/z3wpmMvvDjXbkUih4hyfTMVW0y6jlu0qZxxzR4=;
 b=EK9wp0N6OHodnWUcjWrvOzywebCnYwQ6z7raXSHLUkX7blv7MW8I9EFmUhEvJjMVbHoNmuI6E7d3GukmuSmgYLTfq78jX+a9rAWqLdotSo3WE3kQxPxAPnGfimgcJC3nqFhBtiTdOupu2xPz8OjD7J+n+RXOYIwxKbLgwKVEhAFBjjuavl+3b+5Okc03OrFDEa3Tz1b3rQZ0lvTKGXax9+T/v4FLb9rt7R6VOCKQuiD+MuFJhtvDnBbTvLBrjuLVyxDer3F8CbL4vh4yWTpvx/wW5H5xWpxCWGyD/+cQcL9m/uzrk0FrVRJ01qyQ7J28025C5h6vGs3epsNV7j13dA==
Received: from BN1PR13CA0021.namprd13.prod.outlook.com (2603:10b6:408:e2::26)
 by DM6PR12MB3755.namprd12.prod.outlook.com (2603:10b6:5:1c2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 2 Sep
 2021 02:37:05 +0000
Received: from BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::6f) by BN1PR13CA0021.outlook.office365.com
 (2603:10b6:408:e2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.15 via Frontend
 Transport; Thu, 2 Sep 2021 02:37:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; t-8ch.de; dkim=none (message not signed)
 header.d=none;t-8ch.de; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT059.mail.protection.outlook.com (10.13.177.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 02:37:05 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 19:37:04 -0700
Received: from [10.20.23.105] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep 2021
 02:37:03 +0000
Subject: Re: [PATCH v4] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        <mario.limonciello@outlook.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Darren Hart <dvhart@infradead.org>, <thomas@t-8ch.de>,
        Aaron Plattner <aplattner@nvidia.com>
References: <70b81e33-c769-4cb8-0bae-5ee10a209389@nvidia.com>
 <20210831224906.1072-1-ddadap@nvidia.com>
 <CAHp75VcvhPL2dNy4HdoEU5FtuWQkG-t0tH5rAJRKpeG0iB9AUg@mail.gmail.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <91aa0937-a887-5233-5516-5137d96ae8d7@nvidia.com>
Date:   Wed, 1 Sep 2021 21:37:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcvhPL2dNy4HdoEU5FtuWQkG-t0tH5rAJRKpeG0iB9AUg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d456080e-b0e0-400f-d6fc-08d96dba8d5b
X-MS-TrafficTypeDiagnostic: DM6PR12MB3755:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3755FFA2BAD47223B4FB09BABCCE9@DM6PR12MB3755.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQ4hqGFdQ90F0pZnP+CbeT2Bm8NV7CebWit2ljfqw2hlzLS2MRAQwA4hw7j0TK/sOurIdm26/xBqWFv+20palfc3ZDjox1WWAfqEFkHInKPzwXKvgng8/RmuHPrp1qZU5q6mlq8kyZ6u+m59mr0tX6zGTqiTDt5hdmEFacvXLzbFlcnrmbDIvGbzbnFcA0xyMrXblcklSM+b4rDU2HvETIIcGrzCxs2/E6JSMBQID2hnUK4eIkjULeFHfAWR/ajGSiZ+VfxI1ucE0oYvNFJFFa0NBRRSA4W1aF4AYQHU6PwdnnPatKQYSeSCEwq78Fx2ix4XC+n6cnSjZCjXb8W3QYvfLYivg9dso/nDUgxddxwNeXu4oAJjfQnYFoS6M1aqYR4sqFBiP/V+CimwDeLS3FeNPm3n/jtL+ZYG9Lenm8gcw96YRKgt95FqUNQpK0Hct2+rU8mg+HigeJgze9EoLM0mXSOu70mxOF1Buks87B91btZhCz+iRTYBMZB0j9KNlIeM/1/mBM+ewk7ZMXhQ8VJfmcBnMgbml7hV71QDv7giskfSSLa27f1mHIZOiCNllFQUUqujD0TN1C2UC1m1C1Tys0scvwi4Vn6F/EMW8v7ekLMBf51A2jkvx5XVkQCK8ZRPE53+NZGLkuF9JvYVVPMjsFnJ/NDBhkDyhTvOimS9a2O6oNuTaYqNnUw8/jtATnECcp3aVyudO+YX68jBbHPa7glG9xIbwiZ9avHWiUM=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(36840700001)(54906003)(8936002)(6916009)(26005)(186003)(5660300002)(82740400003)(16526019)(107886003)(31686004)(336012)(478600001)(70586007)(426003)(2906002)(53546011)(2616005)(7636003)(83380400001)(31696002)(36756003)(32650700002)(82310400003)(16576012)(70206006)(8676002)(86362001)(36860700001)(4326008)(356005)(316002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 02:37:05.0917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d456080e-b0e0-400f-d6fc-08d96dba8d5b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3755
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks again, Andy:

On 9/1/21 10:57 AM, Andy Shevchenko wrote:
> On Wed, Sep 1, 2021 at 2:27 AM Daniel Dadap <ddadap@nvidia.com> wrote:
>> A number of upcoming notebook computer designs drive the internal
>> display panel's backlight PWM through the Embedded Controller (EC).
>> This EC-based backlight control can be plumbed through to an ACPI
>> "WMAA" method interface, which in turn can be wrapped by WMI with
>> the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.
>>
>> Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
>> backlight class driver to control backlight levels on systems with
>> EC-driven backlights.
>> Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
> Seems like missed Co-developed-by. Or you are the wrong author. Fix accordingly.


Indeed; as Aaron mentioned, he was the author of a much earlier version 
of this driver which we used internally for testing purposes. He 
actually gave me his blessing to leave his name off the patch even 
before I submitted the original version of the patch for review on this 
list, but I figured it wasn't a big deal to leave him on. Since Aaron 
has suggested taking him off the patch again, I'll just go ahead and do 
that.


>
>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> ...
>
>> +#include <linux/backlight.h>
>> +#include <linux/module.h>
>> +#include <linux/wmi.h>
> types.h ?
> mod_devicetable.h ?


Evidently, these must already be implicitly picked up by the headers 
which I am explicitly including here. I can see the argument for 
types.h, since it's always possible that future changes to the kernel 
might remove it from the implicit include chain, but I'm not certain why 
you're recommending mod_devicetable.h here. If it's because I use the 
MODULE_DEVICE_TABLE() macro, that seems to be defined in module.h.


>
> ...
>
>> +enum wmaa_get_or_set {
>> +       WMAA_GET = 0,
>> +       WMAA_SET = 1,
>> +       WMAA_GET_MAX = 2
> Is it part of HW protocol? Otherwise drop assignments.


Does ACPI count as HW here? I'd certainly prefer to keep the 
assignments, since the other side of this interface is not in the Linux 
kernel.


>
>> +};
> ...
>
>> + */
>> +enum wmaa_source {
>> +       WMAA_SOURCE_GPU = 1,
>> +       WMAA_SOURCE_EC = 2,
>> +       WMAA_SOURCE_AUX = 3
> Missed comma.


Oops. I am definitely a fan of using commas here, but I removed the 
commas that I had in place for the last elements of these enums, and 
members of static initialized structs, because I was trying to more 
broadly apply feedback from earlier to drop the terminal comma in the 
static initialized device table. I realize now that this feedback was 
meant only for the case of the empty struct terminator element in the 
device table.


>
>> +};
> ...
>
>> +/**
>> + * struct wmaa_args - arguments for the ACPI WMAA method
>> + *
> Redundant blank line.
>
>> + * @set:     Pass in an &enum wmaa_get_or_set value to select between getting or
>> + *           setting a value.
>> + * @val:     In parameter for value to set when operating in %WMAA_SET mode. Not
>> + *           used in %WMAA_GET or %WMAA_GET_MAX mode.
>> + * @ret:     Out parameter returning retrieved value when operating in %WMAA_GET
>> + *           or %WMAA_GET_MAX mode. Not used in %WMAA_SET mode.
>> + * @ignored: Padding; not used. The ACPI method expects a 24 byte params struct.
>> + *
>> + * This is the parameters structure for the ACPI WMAA method as wrapped by WMI.
>> + * The value passed in to @val or returned by @ret will be a brightness value
>> + * when the WMI method ID is %WMAA_LEVEL, or an &enum wmaa_source value when
>> + * the WMI method ID is %WMAA_SOURCE.
>> + */
> ...
>
>> +       ret = wmi_call_wmaa(wdev, WMAA_LEVEL, WMAA_GET, &level);
>> +
> Ditto.
>
>> +       if (ret)
>> +               dev_err(&bd->dev, "ACPI WMAA failed to get backlight level.\n");
> ...
>> +static const struct backlight_ops wmaa_backlight_ops = {
>> +       .update_status = wmaa_backlight_update_status,
>> +       .get_brightness = wmaa_backlight_get_brightness
> Missed comma.
>
>> +};
> ...
>
>> +       if (source != WMAA_SOURCE_EC) {
>> +               /* This driver is only to be used when brightness control is
>> +                * handled by the EC; otherwise, the GPU driver(s) should handle
>> +                * brightness control. */
> /*
>   * Wrong multi-line comment
>   * style. Use this example to fix
>   * it properly.
>   */
>
>> +               return -ENODEV;
>> +       }
>> +       /* Identify this backlight device as a platform device so that it can
>> +        * be prioritized over any exposed GPU-driven raw device(s). */
> Ditto.
> And for any other multi-line comments in this driver.
>
> ...
>
>> +       backlight = devm_backlight_device_register(
>> +               &w->dev, "wmaa_backlight",
>> +               &w->dev, w, &wmaa_backlight_ops, &props);
>> +       if (IS_ERR(backlight))
>> +               return PTR_ERR(backlight);
>> +
>> +       return 0;
> return PTR_ERR_OR_ZERO(backlight);
>
> ...


Thanks; Thomas made the same suggestion.


>
>> +MODULE_AUTHOR("Aaron Plattner <aplattner@nvidia.com>");
>> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
> So, Co-developed-by seems missing above.
>
> ...
>
>> +MODULE_LICENSE("GPL v2");
> "GPL" is enough (it's a synonim).


Indeed, Thomas pointed this out as well. I will do some retesting since 
I am changing the backlight driver type from BACKLIGHT_PLATFORM to 
BACKLIGHT_FIRMWARE, then send the updated patch.

