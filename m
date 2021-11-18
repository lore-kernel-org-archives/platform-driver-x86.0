Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31925C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Nov 2021 15:04:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B80D61A52
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Nov 2021 15:04:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbhKRPHU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 18 Nov 2021 10:07:20 -0500
Received: from mail1.bemta24.messagelabs.com ([67.219.250.114]:30202 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229733AbhKRPHU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Nov 2021 10:07:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1637247859; i=@lenovo.com;
        bh=b7y9Ut0DR2EuGYki0yBHFkkudk3V6eBUiqUuZOZEjZ4=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=FP1IxSk5g3D0XmJ7yXDI+ugLr4Feq7VbPJuaXD51poQsjBdvK14oMi1qpIvvB3Q+m
         a9oT50Dk3N6HH23pe0xxPAc/sdP4ymeg9eBCcg9XWBWtyAEgn6CxPBStfnRYl82jNt
         6jJWhpHtj6MF1ncbWKQaN0lHiV20fU07/Z/Jb7x2APcMKqDfTWNGL6uJMSipK3EvbH
         iAnJMT9wla2WdDuu2AzQSXGHoQuueMg0JQWTr5tuEl6VfvKdJdroK1jolXOmotTqPk
         ceTlnZevCM1gk+SKzXSPIg1HZwVdEs9iWt2qwJxF5vqNdCYvd2lV0U7QgWLSTL8aIY
         lml4GGjQ5hGzg==
Received: from [100.112.133.13] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.us-west-2.aws.symcld.net id 5A/B3-31742-37B66916; Thu, 18 Nov 2021 15:04:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNJsWRWlGSWpSXmKPExsWSoS+lr1ucPS3
  R4MUEQYs3x6czWXzumMxisXrPC2YHZo95JwM93u+7yubxeZNcAHMUa2ZeUn5FAmvGk4O3mAte
  CVbce3SFtYHxDl8XIycHo8BSZon7bwu7GLmA7EWsEp0Pb7FDOJ1MEou6Z7KBOEIC85gkZpw9B
  +UcZpJoam1lB+mXEDjOKNG9yh0i0ckosXvrD6iqSUwSLed/QzlPGCUet6xnh3P69rcwgvTzCt
  hKTFu6jRnEZhFQlVh5+jwTRFxQ4uTMJywgtqhAuMTZVbfBaoQFgiV+3roIZjMLiEvcejIfrF5
  EQF1iakcPG0TcWWJSywSozdsZJWbtv80KkmAT0JbYsuUXWBGngJ3Ezeer2SEaNCVat/+GsuUl
  tr+dA7ZASEBZ4lf/eWaIRxUldrS9gXo6QaLn3yM2CFtS4trNC1BxWYmjZ+ewQNi+Erfbv0DFt
  ST+L30PFc+RWLnsDlRcTWLf5XvMExj1ZiH5eRaS32YhOW8WkvMWMLKsYrRIKspMzyjJTczM0T
  U0MNA1NDTSNTQ21TU0N9JLrNJN0ist1i1PLS7RBXLLi/WKK3OTc1L08lJLNjECU1FKQfuaHYw
  73nzQO8QoycGkJMq75v/URCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvL6O0xKFBItS01Mr0jJz
  gGkRJi3BwaMkwnvOCSjNW1yQmFucmQ6ROsVozzHh5dxFzByXr88Dkl09C4HkpCO7tzMLseTl5
  6VKifPOBmkTAGnLKM2DGwpL45cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfN+BZnCk5lXAr
  f7FdBZTEBnyV6eDHJWSSJCSqqBadptTlf3Ob6JGm1dfEl5HAd2sC38fP77r9e7FM5WHxHYHbT
  giLapqt959z7DKV+2hR1MObvlEfuaKI5TewSXaF5+7/zXTS7/Yr/YqujUi9JLlkaeMYt7Ycgv
  05i0tmPuqTMfQ9acOBB9QeRjn0Ga6SR2nVgxjXm5X45OqnG/NXle59e6Pc8NJ7C39fYo/5f7o
  bo+41LmvCu/15pWHb7y4GTKRd9/Kn+uOq28HnP7VVhNlGvWlANKHTFPpvALveHIXy4VdEK+Oi
  2cTd1J0ZnhR0B9eu+miHBbBa9sJ9MqA/6Qrp+Lrn+Of6+6VUBhRczrVdcL+t7pcVh+FGviT/w
  4V9TRp8m1OY3t4K47DdZzlFiKMxINtZiLihMBnqT5Yl4EAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-9.tower-355.messagelabs.com!1637247858!23406!1
X-Originating-IP: [104.47.26.47]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27076 invoked from network); 18 Nov 2021 15:04:19 -0000
Received: from mail-psaapc01lp2047.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.47)
  by server-9.tower-355.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Nov 2021 15:04:19 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDpf/GN1KsHTrp2pAVBk3WLIBI2a/ftd4At+0l37OB4hiFxeusbP2mSOOMHG2+lldFTt60iIbGZYWtbHu1HWxkUJG6OPa8yyLa3scTggqBMDjHS/y2CpdXJ8W3Ie2kdyZl5bXKc5/H75wPlPwHuvIH0sUeiWYAmpsP4/iilwZsgcyhDJjGUs/efODCor8kJP7AmdePlxevsDXoNRrOSXhwTlKPvsoxPg9ypxt2NEGeMGS7Qgp9Dtnuq4OTrxOERntZkUs9JdD7z+ITYiGT30Aliy80/zDaWzQ/ZX+mG5t4J/vCQFuNFPKgNOXUmdKvjtlib1WcT78L0Gs6RCJOcLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7y9Ut0DR2EuGYki0yBHFkkudk3V6eBUiqUuZOZEjZ4=;
 b=T/sB3zDLDPqcsYfKaZyZo9xIEgpEt0ClDERK/bQfAipVNMdxEBHJFaaBuwkkg1AblHhMyqy1EDIwpZW+JjNSMjzzBKZ4VOBNSxQ0FLaG5fKQ7bvcNtAqw6qR6ugiU0dbiDP5wlubiOqTr6+YuQFBtUPaAF+5YH2NRGJ/aL9D6kdFFJpt/ojT+6EIEuwxnhV3ETHhyvJwTnhnNPt2poDW4D5U0FdhTVWZMtwFaJbAxrvkgxk70CkM4PDL0Dnhon4Ay5/1FY9s3mqLEb/Riizts8976vZ1E0iw/ljCzgtVu1LkaVvRdFATlHhzqtcmQ8EU6TvpiLkF4c6Ql3O0AFgv8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from HK2PR0401CA0011.apcprd04.prod.outlook.com (2603:1096:202:2::21)
 by SI2PR03MB6221.apcprd03.prod.outlook.com (2603:1096:4:14f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.10; Thu, 18 Nov
 2021 15:04:16 +0000
Received: from HK2APC01FT024.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:2:cafe::c1) by HK2PR0401CA0011.outlook.office365.com
 (2603:1096:202:2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Thu, 18 Nov 2021 15:04:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 HK2APC01FT024.mail.protection.outlook.com (10.152.248.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 15:04:16 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Thu, 18 Nov
 2021 10:04:14 -0500
Received: from [10.38.106.125] (10.38.106.125) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Thu, 18 Nov
 2021 10:04:13 -0500
Message-ID: <1f9bd1f6-a6dc-be4e-a2df-f1ff69c357ef@lenovo.com>
Date:   Thu, 18 Nov 2021 10:04:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [External] Re: [PATCH v2 2/2] platform/x86: think-lmi: Opcode
 support
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <mgross@linux.intel.com>, <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20211117184453.2476-1-markpearson@lenovo.com>
 <20211117184453.2476-2-markpearson@lenovo.com>
 <d3df51cb-271b-c2b4-0692-2999d0740ad4@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <d3df51cb-271b-c2b4-0692-2999d0740ad4@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.106.125]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08daf65c-38e3-412f-4da6-08d9aaa4b0bd
X-MS-TrafficTypeDiagnostic: SI2PR03MB6221:
X-Microsoft-Antispam-PRVS: <SI2PR03MB62216AD0B9B4BACC8A1FEEE8C59B9@SI2PR03MB6221.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xEy4ZggVdlXQeSOEmCHrEd+xZgFjCUQ+JO5WksbpeqzN7KxWHkl3ScrWPn5TBcg2IV0j0MdN8KcULICV7wGqgQ7z3uVsj1LnfMToXrXydt/eAWxBvrRNR+aFE8m9E3O1Ujew+eIpiTNWUrAtmodCUeknT6CImmbNO2WMWG6/VN2pp7A+aWxQ5DsFfvQ1U7DswCOfkh7x5p0mUpY2uIM0lMzQ1qCq/78Jy9WfmrJxKtnuBrsxAny6xffPfRYdIG87bNujxKVR1G2US5Fjv0mgYxrHPoKz9U2OGA/hJ9Q4PjxWF5ekWZjdWD/MqTLrsKyVTUMJ2U7Y75Co5a75chQepzs2299wpykDMczV3xWLzIVd5K2zKrRyFCmNjwpQQxQnDy2Kizhc7mL5QgwDFVzIwU9FE9gu9+gpKUvKeMtG6YoeWi6UWI9epnKFU+uyUZZWZ2gQkY53mUW7X8UTDdYE9bVWAhNcQzvf4j6qod8KdqP6zShQdlUMq4NjnFIZQIMHJfCg+y+5n0UvjK4SGY3uthiyFWeJ//6uzO0dAZaxSejt+SuN5uU25vlCe2bODrJmVHqW0iQNNvibNabQ+zP///BAHGDT1wY0S49YNbPNeO97KD9w/wAFwtipGxD+xPmTpqXWlOUE7sXMF4e0b/fDM4XmiOZOatXiW+Zv7Azc4+V4YedTOCRq8jKS137wsQBoVBR3RrQADgvrWz0Bjpvrh/tOL0O2+V7xwWajDPyNpUHXfBc9275ecaOAPlLMQx+M8oVCvbB0ueB/Znc/EgFhIFo/MgQ5+S49BDF2oB+5jMb11E6gg8U0QAp/hTcobE+tAU/v1RvWKddDOoUDbvKY6wTcUQxgGrU1x8T8KGAaGPwi2C/msvbVRnysTaL3tURnC/f/IwyAQm5bG1Lt5mtLCFHRwh8Ux5RKA+ARbbIHQjzMpWWyMz1/nDKMZnqWoBqQ
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(16526019)(2616005)(36906005)(83380400001)(70586007)(5660300002)(8936002)(47076005)(81166007)(70206006)(82960400001)(53546011)(356005)(16576012)(8676002)(426003)(336012)(186003)(31696002)(316002)(4326008)(54906003)(4001150100001)(6916009)(36860700001)(36756003)(86362001)(82310400003)(508600001)(31686004)(966005)(26005)(2906002)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 15:04:16.1442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08daf65c-38e3-412f-4da6-08d9aaa4b0bd
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT024.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6221
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Hans

On 2021-11-18 06:32, Hans de Goede wrote:
> Hi Mark,
> 
> On 11/17/21 19:44, Mark Pearson wrote:
>> Implement Opcode support.
>> This is available on ThinkCenter and ThinkStations platforms and
>> gives improved password setting capabilities
>>
>> Add options to configure System, HDD & NVMe passwords.
>> HDD & NVMe passwords need a user level (user/master) along with
>> drive index.
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>> ---
>> Changes in v2:
>>  - Rebased to latest
>>  - Fixed kobject_init implementation for system-mgmt and drive roles
>>  - Added is_visible support for level and index attributes
> 
> Thank you.
> 
> I noticed one small issue, where tlmi_priv.pwd_admin would get
> free-ed twice on a goto fail_free_pwd_admin.
> 
> I've squashed in the following fix to fix this:
> 
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -1152,7 +1152,7 @@ static int tlmi_analyze(void)
>  	tlmi_priv.pwd_power = tlmi_create_auth("pop", "power-on");
>  	if (!tlmi_priv.pwd_power) {
>  		ret = -ENOMEM;
> -		goto fail_free_pwd_admin;
> +		goto fail_clear_attr;
>  	}
>  	if (tlmi_priv.pwdcfg.core.password_state & TLMI_POP_PWD)
>  		tlmi_priv.pwd_power->valid = true;
> @@ -1204,8 +1204,6 @@ static int tlmi_analyze(void)
>  	}
>  	return 0;
>  
> -fail_free_pwd_admin:
> -	kfree(tlmi_priv.pwd_admin);
>  fail_clear_attr:
>  	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i) {
>  		if (tlmi_priv.setting[i]) {
> 
Thanks - good catch.

> Thank you for your patch-series, I've applied the series to my
> review-hans branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans>> 
> Note it will show up in my review-hans branch once I've pushed my
> local branch there, which might take a while.
> 
> Once I've run some tests on this branch the patches there will be
> added to the platform-drivers-x86/for-next branch and eventually
> will be included in the pdx86 pull-request to Linus for the next
> merge-window.
> 
> Regards,
> 
> Hans
> 
> p.s.
> 
> I've also noticed 2 small possible cleanups, I will send out
> a patch-series for that soon. Can you please give these cleanups
> a test-spin (on top of my latest review-hans branch) ?

Will do. Thank you!
Mark

