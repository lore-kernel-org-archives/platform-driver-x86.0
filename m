Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F9BC47080
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 May 2021 14:30:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 665E061375
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 May 2021 14:30:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232657AbhEaOcC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 31 May 2021 10:32:02 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.2]:23662 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234058AbhEaO36 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 May 2021 10:29:58 -0400
Received: from [100.112.131.68] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-a.us-west-2.aws.symcld.net id 4C/E7-12171-622F4B06; Mon, 31 May 2021 14:26:46 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBIsWRWlGSWpSXmKPExsWS8eIhr67apy0
  JBkt3y1pMmvGf2eLN8elMFp87JrNYrN7zgtmBxWPzCi2PeScDPd7vu8rm8XmTXABLFGtmXlJ+
  RQJrRs+1TSwFy4QqPn9uYGxgPMDfxcjFISTwn1HiWPsaFgjnMaNE++EHQA4nh7BAtcSC11/Ab
  BGBYom1fy4yg9jMApoSz9o6GEFsIQELibvPN4HVsAloS2zZ8osNxOYVsJW4/ucnWJxFQFXif/
  casHpRgXCJ3R0vmSBqBCVOznwCVsMpYClxes00oPkcYPPX79KHWCUucevJfCYIW15i+9s5YCd
  ICChKLP52lxXCTpDo+feIbQKj4CwkU2chTJqFZNIsJJMWMLKsYjRPKspMzyjJTczM0TU0MNA1
  NDTSNTQ20DUx0kus0k3UKy3WLU8tLtEFcsuL9Yorc5NzUvTyUks2MQIjJKWgSWsH46vXH/QOM
  UpyMCmJ8oorbk4Q4kvKT6nMSCzOiC8qzUktPsQow8GhJMHr9WFLgpBgUWp6akVaZg4wWmHSEh
  w8SiK8zu+B0rzFBYm5xZnpEKlTjIpS4ry9IH0CIImM0jy4NliCuMQoKyXMy8jAwCDEU5BalJt
  Zgir/ilGcg1FJmNf6I9AUnsy8Erjpr4AWMwEt/hy6CWRxSSJCSqqBiZ1lQ9TSSSUJ51OVss61
  TZ32ooNZROiOZPhSDeM7JxaIC9xcz+TfZDj3z7SnavE/HnaL6Z7zP9I1j6/g+eGExIPzH06tu
  7HbTDFWm7VZ8mebhcr2foH4A/1eyUz7BL37L65mtVb6nzRp4ZLGCi/JfaHbYooEDPo/iYZcuc
  F2KrTlj9qtKy8v1/GXW7h9ft8RezTs68uDwnsTlm+ZP4+1bFlLYt9J5ivGoV0S2T8zbTo/sXH
  r7xA5p9gV+U1sDl/uxmOR17/945yxx3vT1pl2E9MsH1nEHL1f4qhrJPHP85bAyUO7HrA4soZG
  rcj+GK1u+Ozlh9M3pJ88nZt7nvdt8vfb3Qltj88fC1Iuf7ZgmxJLcUaioRZzUXEiADqeXF6LA
  wAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-10.tower-326.messagelabs.com!1622471205!4915!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16098 invoked from network); 31 May 2021 14:26:46 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
  by server-10.tower-326.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 May 2021 14:26:46 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 44487915917797F705E7;
        Mon, 31 May 2021 10:26:45 -0400 (EDT)
Received: from [10.46.192.131] (10.46.192.131) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Mon, 31 May
 2021 10:26:44 -0400
Subject: Re: [External] [PATCH] platform/x86: thinkpad-lmi: Remove unused
 display_name member from struct tlmi_pwd_setting
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
CC:     <platform-driver-x86@vger.kernel.org>
References: <20210531135911.82582-1-hdegoede@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <73cb3498-5229-d3e4-f18c-c2e72e77b6b3@lenovo.com>
Date:   Mon, 31 May 2021 10:26:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210531135911.82582-1-hdegoede@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.192.131]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 2021-05-31 9:59 a.m., Hans de Goede wrote:
> The struct tlmi_pwd_setting display_name member is initialized,
> but never read. Remove it and the TLMI_PWDTYPE_MAXLEN define.
> 
> While at it also remove some other unused [MAX]LEN defines.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/think-lmi.c | 2 --
>  drivers/platform/x86/think-lmi.h | 9 ---------
>  2 files changed, 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 854427fed1a9..782d8e3fe7a1 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -819,7 +819,6 @@ static int tlmi_analyze(void)
>  		ret = -ENOMEM;
>  		goto fail_clear_attr;
>  	}
> -	strscpy(tlmi_priv.pwd_admin->display_name, "admin", TLMI_PWDTYPE_MAXLEN);
>  	strscpy(tlmi_priv.pwd_admin->kbdlang, "us", TLMI_LANG_MAXLEN);
>  	tlmi_priv.pwd_admin->encoding = TLMI_ENCODING_ASCII;
>  	tlmi_priv.pwd_admin->pwd_type = "pap";
> @@ -836,7 +835,6 @@ static int tlmi_analyze(void)
>  		ret = -ENOMEM;
>  		goto fail_clear_attr;
>  	}
> -	strscpy(tlmi_priv.pwd_power->display_name, "power-on", TLMI_PWDTYPE_MAXLEN);
>  	strscpy(tlmi_priv.pwd_power->kbdlang, "us", TLMI_LANG_MAXLEN);
>  	tlmi_priv.pwd_power->encoding = TLMI_ENCODING_ASCII;
>  	tlmi_priv.pwd_power->pwd_type = "pop";
> diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
> index 6cd5325cc50e..6fa8da7af6c7 100644
> --- a/drivers/platform/x86/think-lmi.h
> +++ b/drivers/platform/x86/think-lmi.h
> @@ -8,15 +8,7 @@
>  #define TLMI_SETTINGS_COUNT  256
>  #define TLMI_SETTINGS_MAXLEN 512
>  #define TLMI_PWD_BUFSIZE     129
> -#define TLMI_PWDTYPE_MAXLEN   64
> -#define TLMI_ENC_MAXLEN       64
>  #define TLMI_LANG_MAXLEN       4
> -#define TLMI_PWDTYPE_LEN       4
> -/*
> - * Longest string should be in the set command: allow size of BIOS
> - * option and choice
> - */
> -#define TLMI_GETSET_MAXLEN (TLMI_SETTINGS_MAXLEN + TLMI_SETTINGS_MAXLEN)
>  
>  /* Possible error values */
>  struct tlmi_err_codes {
> @@ -43,7 +35,6 @@ struct tlmi_pwdcfg {
>  struct tlmi_pwd_setting {
>  	struct kobject kobj;
>  	bool valid;
> -	char display_name[TLMI_PWDTYPE_MAXLEN];
>  	char password[TLMI_PWD_BUFSIZE];
>  	const char *pwd_type;
>  	const char *role;
> 
Thanks Hans - good catch.
Mark
