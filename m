Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B79C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Mar 2022 17:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236695AbiCQRJz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Mar 2022 13:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbiCQRJz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Mar 2022 13:09:55 -0400
Received: from mail1.bemta33.messagelabs.com (mail1.bemta33.messagelabs.com [67.219.247.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A86049E9CA
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Mar 2022 10:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1647536913; i=@lenovo.com;
        bh=5g9kemcZxIxwvwioi/3AlKwz0vH7IUCDONZUNPzbDe8=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=LRLl0N3iHeCcLAbCb3i2koDAIMGd8MpUtwjIAufSJhgejL7ng4E6a2/vArEzSw9QN
         yXRrRANx3IyF3IN4utYiDfu6EzrA3cH1+W3Opq4PbxXUWLI1D3cCivZz7aWthZ1oTv
         8W0gR/wgzso9bZCa3ASF8mD636C6Vcv0PYaT4gY754nlc1yKrGi2Pxs6tSmzj9Gukr
         NzuB0jDckg7UMKDQepuyX6DzGepsQ+bDEwoMwqeRPfWa8MywA+UQhkska0vxWgPWUc
         nUN1Y2/hYFweDa0Z+Th6xo0QiU+WGtghs08ThvN+HAq3Y10ASMHLSuJq0AAg63nw12
         qjrQnK4PQHhcA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLJsWRWlGSWpSXmKPExsWSoS+VqSuYbZx
  kcGORlMWb49OZLA5MncZssXrPC2YHZo9NqzrZPN7vu8rm8XmTXABzFGtmXlJ+RQJrxv+T/xgL
  XspUfLx4jLWBcZl4FyMXB6PAUmaJM/teMUI4i1glnj5/A+V0Mkks6p7JBuIICcxjkrh84yyUc
  5BJYu27yaxdjJwcEgLHGSW6V7lDJDoZJXZv/QFVNZFJYvbMFawQzhNGia4Hy6Gce4wS36YeYg
  Tp5xWwlThz4gUziM0ioCqx4OFPJoi4oMTJmU9YQGxRgXCJ+88+s4HYwgKlEuv6v4DZzALiEre
  ezAerFxFQl5ja0QMU5wCKO0o0HOSD2NXOKNE7cS/YHDYBbYktW36B9XIK2Ek8/vmOHWKOpkTr
  9t9QtrzE9rdzwO4RElCW+NV/nhniTzmJFXuvQ9kJEs1TjjJC2JIS125eYIewZSWOnp3DAmH7S
  pxYtYwJwtaVeHR3B5SdI/H11C9WmJmnes8xTWDUnYXk5VlIXpuF5LxZSM5bwMiyitE6qSgzPa
  MkNzEzR9fQwEDX0NBE19xQ18jQSC+xSjdRr7RYNzWxuEQXyC0v1kstLtYrrsxNzknRy0st2cQ
  ITEkpRe5XdjDeX/lT7xCjJAeTkijvUXXjJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvBKZQDnB
  otT01Iq0zBxgeoRJS3DwKInwhusApXmLCxJzizPTIVKnGHU5rmzbu5dZiCUvPy9VSpxXIBGoS
  ACkKKM0D24ELFVfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMOwXkEp7MvBK4Ta+AjmACOq
  JRwAjkiJJEhJRUA1PT45isdfXvy9obU39tE3nebq26VC3HY3bx/IPKfyyV0k9siVISrXXIr2E
  MdPR4efXo6puvX5ZFuLRPd/45M+Dz8rVPFuQte3AyzezyliUM94R7Z37y0Zwn1R16ufvuyYR0
  v7Lfl13yt538uY9V1rdmV+LGrk1mXHpmAh84b1/6mfwgMO3MxinOr+L4jpaHdX7fLSYbz3Vq3
  mK+F1/sp/K7dczIm8IVs/vzpEiveZZfJhVoRaazl06w3Fx6+bLZu1Veb2UO+Nnp29s0L7vHnv
  bNQjDEqv19FdfP35Eb1N7VX3nzrbzaOHhpv/myHb4yhdVLnv0t19n6/thJ+0MbTA5+2DSB231
  9x0vGxqniZZFKLMUZiYZazEXFiQDiSKUsUAQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-3.tower-715.messagelabs.com!1647536911!34254!1
X-Originating-IP: [104.47.26.105]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19245 invoked from network); 17 Mar 2022 17:08:33 -0000
Received: from mail-sgaapc01lp2105.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.105)
  by server-3.tower-715.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Mar 2022 17:08:33 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKysMCJhd9HuJhBzMcGcYOdWBvWcKSrklH/81IxxSumKGV3oy91xpQLv8J3HQxaJpS7hdYAcv6xmnsCA+ckpx1rFs2zaRvamCyrKQR35mjMGZ+4MYs+Ceynexn5Yg8ETRvWJ0TTcsrKCFYljPtvWjwrVdOCG798DNYXdTcb/V1jVYSj7vLa1P4LspYo2on5oVqkGDf8V3wKTqsEHOPJwupBXMim7OOnCFI1bs5db7qRcUg0dx3BbG8ScI+mf4OBGzpv8gjCrcsFwdztu/zRISWviFs3mYt9qVRiy0Bk9HYMwR/CdPIUZX2DYh54aK0ScYPbLez8fXVEoOodz6YmlOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5g9kemcZxIxwvwioi/3AlKwz0vH7IUCDONZUNPzbDe8=;
 b=R4+3Y8MMQJJIn3gC8rzp9mWwhQ9/qyi74+fykYp9hlosQ8eRLwcQx8q+m+fw+EoS1l41K0qq7+/yHG3gd/30AxbE66nfRbXZxIKL0FdR4N4khYMpkD9SV6lQb4yerk1dZe4nWnhNKQGHgX1jJhvC4jyB9KVf0HzSvJuikNwx9ykYvoy3tTuJntyAGLkeQWkFzuE3xuQVwFvGn491jzaLvq5FYTW75yz09Cx7B3kKBd6ajkud6jbIjF7k5l58KfPt6EqqxL3TJV+8YVKJf0zQclPa87blOe8CUtJXTMKHuR/3uiGjOQbRKgLkhqxgr3LXssgd9gOp3ZY8K2HeZIe2tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from HK2P15301CA0020.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::30)
 by SI2PR03MB5999.apcprd03.prod.outlook.com (2603:1096:4:14b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.10; Thu, 17 Mar
 2022 17:08:30 +0000
Received: from HK2APC01FT047.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:1:cafe::1) by HK2P15301CA0020.outlook.office365.com
 (2603:1096:202:1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.6 via Frontend
 Transport; Thu, 17 Mar 2022 17:08:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 HK2APC01FT047.mail.protection.outlook.com (10.152.249.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 17:08:29 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Thu, 17 Mar
 2022 13:08:28 -0400
Received: from [10.38.63.5] (10.38.63.5) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Thu, 17 Mar
 2022 13:08:27 -0400
Message-ID: <90f1a4ce-a3ba-ed14-f27a-348af368afad@lenovo.com>
Date:   Thu, 17 Mar 2022 13:08:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [External] Re: [PATCH v2 1/2] Documentation:
 syfs-class-firmware-attributes: Lenovo Certificate support
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <markgross@kernel.org>, <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20220315195630.3209-1-markpearson@lenovo.com>
 <c3ef4c4e-9862-88f6-ef7f-2fd741ce9ea9@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <c3ef4c4e-9862-88f6-ef7f-2fd741ce9ea9@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.63.5]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0d306c3-3ec9-4e50-deee-08da0838c2a7
X-MS-TrafficTypeDiagnostic: SI2PR03MB5999:EE_
X-Microsoft-Antispam-PRVS: <SI2PR03MB5999ECD8628FD21C5A066C44C5129@SI2PR03MB5999.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2xhugUyk5PjkIh19WHG62ylqBmz6brKr8qARA88GWl4P0BuD5Mbh5q/nqnkPh2bNZMcTv0I8zeT+w3SYJbYMwFUZ31F6dXMGPJNgtAAVbWgmj3FFg1S0IudJmTdc9tP+nmh9w845KynFXrV4eew/8t/tPBrSWwwKiR/GxrO6anSGRbztoIYJZnb2zHdxtnH3WWqu3ZgF8is5tgpRsU9Rx96jpRHCVLvH3JVxUxUKjGObCayHOMA6cvFbI26dQq2T6VLq+ZwS0i8n8xPJlcxiw6iGV3JrenMR/XPq4kUh5mz4gH5kJAa+DzvkLpM5a17jEFjWkV5eu6vsZ3v38FJcOJQXJYH/KPYD3PPoBYDtt0cdJSJJScWCfOw8CXIOCL/dDayJk7K8RC0RqE2PyvxyuD6i8VTFyxS8RRjlRm8y1Ae3kPgrH2f3zdUMVVKe/AbVJtmPsmgvkxs+VGCYt47VsDq+lcuIOWcwi1wkRqThDwZZp7egQ86nsRO5J96GsmAk4jke4EHE9fr+mX86QOsfX6hV2D4N33R3Dqn5YiNW6QZFZQozMKXjS1kkBnGwTRlpa5wns0V8fqNUg35h78FJzIQCo8uveivUpJ5UouSg7xX+VWob08zSf9xfimMb1AIUsInB2w6xANL2GoeBu3n+OYq8I29+FdyCBDF655X5tbvAmBTx/gZ6vfvno7R2sDBZDphMBAtGPJ1xNptQe3eS6klSYM/6Fzj5nWsoyklBCLjUpebg+yULBNDuIgpYjwz65FqGwnLb+3/OikhblSsxP9fJ8cbMEpCMAvDneAC/se98+uy8GX0WOIk/Hj3+ixuB
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(2906002)(83380400001)(2616005)(82310400004)(186003)(336012)(26005)(16526019)(426003)(81166007)(356005)(82960400001)(86362001)(31696002)(40460700003)(47076005)(36860700001)(4326008)(53546011)(70206006)(70586007)(8676002)(508600001)(31686004)(8936002)(5660300002)(36756003)(36906005)(316002)(54906003)(16576012)(6916009)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 17:08:29.8631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d306c3-3ec9-4e50-deee-08da0838c2a7
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT047.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5999
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


Hi Hans,

Thanks for the review

On 2022-03-17 06:58, Hans de Goede wrote:
> Hi,
> 
> On 3/15/22 20:56, Mark Pearson wrote:
>> Certificate based authentication is available as an alternative to
>> password based authentication.
>>
>> The WMI commands are cryptographically signed using a separate
>> signing server and will be verified by the BIOS before being
>> accepted.
>>
>> This commit details the fields that are needed to support that
>> implementation. At present the changes are intended for Lenovo
>> platforms, but have been designed to keep them as flexible as possible
>> for future implementations from other vendors.
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> 
> This looks good, but looking at this a second time I still
> have one open question:
> 
> What is the difference between removing a certificate and
> switching back to password auth?
The main difference is clear goes to no-authentication, and switching
obviously switches to password

> 
> Looking at the WMI calls there are 4 different calls:
> 
> LENOVO_SET_BIOS_CERT_GUID
> LENOVO_UPDATE_BIOS_CERT_GUID
> LENOVO_CLEAR_BIOS_CERT_GUI
> LENOVO_CERT_TO_PASSWORD_GUID
> 
> Going by these names I guess there can be only 1 certificate
> otherwise I would expect:
> 
> 1. add/remove naming
> 2. update to take an id of which certificate to replace
> 
Correct - there is only one certificate

> So I guess that LENOVO_CLEAR_BIOS_CERT_GUI disables all
> authentication. IOW, installing a cert replaces/clears
> the supervisor password and the difference between
> clearing the certificate and cert-to-password is that
> after clearing it we end up with no supervisor password
> set, where as cert-to-password sets the passed in password
> as the new supervisor password?
Correct

> 
> Or does clearing the certificate fall back to the old
> supervisor password if one was set?  (that might lead to
> some interesting issues if users clear the certificate
> many years after the password was last used ...)
clearing reverts to no password

> 
> Given where we are in the cycle I was planning on adding
> this to my review-hans branch so that it could maybe still
> get into 5.18, but given the above questions as well
> the remark about the test X1 BIOS you are using I've
> a feeling it would be better to give this some more time
> to bake and target 5.19 instead. Do you agree ?

I'd love to have it in 5.18 as I expect his feature to be available in
our 2022 platforms and they're all going to start landing in the next
couple of months. If that's unrealistic I can live with it so I'll defer
to your preference

> 
> Regardless  of this is 5.18 or 5.19 material can you? :
> 
> a) confirm that I've understood how the clearing vs cert-to-password
>    works correctly ?
Confirmed :)

> b) confirm that despite you using a test BIOS the WMI API for this is
>    final and that it will *not* change before there are production
>    BIOS-es with this ?
I think I'm safe confirming this (I always get slightly nervous as it's
outside my control, and weird things happen...) We have an internal spec for
this feature and this implementation is meeting that spec. I'd be very
surprised if there are extra changes.

> c) submit a version to clarify the clearing vs cert-to-password thing, e.g.:
> 
> @@ -276,6 +276,8 @@ Description:
>  
>  					You cannot enable certificate authentication if a supervisor password
>  					has not been set.
> +					Clearing the certificate results in no bios-admin authentication
> +					method being configured allowing anyone to make changes.
>  					After any of these operations the system must reboot for the changes to
>  					take effect.
> 
Ack will do

Mark
