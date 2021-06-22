Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA31C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 19:56:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03C276100B
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 19:56:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232582AbhFVT6W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Jun 2021 15:58:22 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.5]:21223 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231726AbhFVT6W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Jun 2021 15:58:22 -0400
Received: from [100.112.131.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.us-west-2.aws.symcld.net id C3/05-57636-55042D06; Tue, 22 Jun 2021 19:56:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFIsWRWlGSWpSXmKPExsWSLveKTTfE4VK
  CQddcG4s3x6czWSxev4zR4nPHZBaL1XteMDuweLRe+svmMe9koMf7fVfZPD5vkgtgiWLNzEvK
  r0hgzZi3ciVTwTLuiusrL7M1MJ7l7GLk4hAS+M8osaW3mwnCecwo8bP3GGsXIyeHsECcxOdPB
  8ASIgJHGSWmffvEApIQErCT6Hi/hBHEZhPQltiy5RcbiM0rYCvR9+UxmM0ioCrx/dV1sBpRgQ
  iJhzu3MELUCEqcnPkEbA6ngL3E5tYrQDYHB7OApsT6XfogYWYBcYlbT+YzQdjyEtvfzmEGsSU
  EFCWeb93PBGEnSPT8e8Q2gVFgFpKpsxAmzUIyaRaSSQsYWVYxmicVZaZnlOQmZuboGhoY6Boa
  GukaGhvqmpnoJVbpJuqVFuuWpxaX6BrpJZYX6xVX5ibnpOjlpZZsYgRGQ0pBs8MOxt1vPugdY
  pTkYFIS5e3QvJQgxJeUn1KZkVicEV9UmpNafIhRg4NDYMa5udOZpFjy8vNSlSR4mW2A6gSLUt
  NTK9Iyc4ARC1MqwcGjJMK72A4ozVtckJhbnJkOkTrFqCglzrsVJCEAksgozYNrgyWJS4yyUsK
  8jAwMDEI8BalFuZklqPKvGMU5GJWEeW+ATOHJzCuBm/4KaDET0GKF3xdBFpckIqSkGphyW0+b
  +/nyCT6uX3664vmcPR/fMqubcDP7/TZ7ZNf+gFGN61W4sEcVwzk/FiOulU/m9c3Pz0vQnlFg8
  1HX0G4qb8OLvHPt9j2qibGrFZo53otaq+heXhEukMMpzlJdqfi7ddejZ0JHfunVHxeW3LhAX3
  eBQkfnyceJ0UtFi7ezPGzwnPGqNzZ8hRK/kv1xkX1GtbuWKgicMHmy/cgFt113zSTnXLQ2YEg
  zWsfWLTP1ktDcyUdNWF6vcBReL+MraT054eeNx03P3Bdxx11IjXh0KMWqPenSa7vV73ScjE7X
  Kb3ouXHCrjv1rN0cd/O3P++kzZ+aVWy7Q7hc/kPAnffn/uyZJbhPIT4mqlpUTYmlOCPRUIu5q
  DgRACRE4imNAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-19.tower-336.messagelabs.com!1624391763!5380!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4519 invoked from network); 22 Jun 2021 19:56:04 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-19.tower-336.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Jun 2021 19:56:04 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 040F5890768BD38C3A71;
        Wed, 23 Jun 2021 03:56:01 +0800 (CST)
Received: from [10.46.192.197] (10.46.192.197) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Tue, 22 Jun
 2021 15:55:59 -0400
Subject: Re: [External] [PATCH] platform/x86: think-lmi: Fix issues with
 duplicate attributes
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
References: <20210622175516.10100-1-mario.limonciello@amd.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <97b375ca-6801-2872-33dd-5591cace578d@lenovo.com>
Date:   Tue, 22 Jun 2021 15:55:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622175516.10100-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.192.197]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 2021-06-22 1:55 p.m., Mario Limonciello wrote:
> On an AMD based Lenovo T14, I find that the module doesn't work at
> all, and instead has a traceback with messages like:
> 
> ```
> sysfs: cannot create duplicate filename '/devices/virtual/firmware-attributes/thinklmi/attributes/Reserved'
> ```
> 
> Check for duplicates before adding any attributes.
> 
> Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/think-lmi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index d2644230b91f..b029d4a5bc3c 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -691,6 +691,13 @@ static int tlmi_sysfs_init(void)
>  		if (!tlmi_priv.setting[i])
>  			continue;
>  
> +		/* check for duplicate */
> +		if (kset_find_obj(tlmi_priv.attribute_kset, tlmi_priv.setting[i]->display_name)) {
> +			pr_debug("duplicate attribute name found - %s\n",
> +				tlmi_priv.setting[i]->display_name);
> +			continue;
> +		}
> +
>  		/* Build attribute */
>  		tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
>  		ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj, &tlmi_attr_setting_ktype,
> 
Thanks Mario - I don't think I'd tested it on the T14 AMD yet.

Change looks good to me
Mark
