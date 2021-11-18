Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC3AC433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Nov 2021 15:46:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 065BE61B39
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Nov 2021 15:46:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbhKRPtW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 18 Nov 2021 10:49:22 -0500
Received: from mail1.bemta33.messagelabs.com ([67.219.247.2]:34301 "EHLO
        mail1.bemta33.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232651AbhKRPtV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Nov 2021 10:49:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1637250381; i=@lenovo.com;
        bh=8m+42UV1o3fYIrWev91YNBsTDLOyPR4A4h7wOE0IWvg=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=AY2B/scUm3SigeUHkdebD53gr3tOp1Fl5+EsUv5sA4R8y5kSgxg+FR6GsPwZSwwDb
         57t+pJOhix/9HAXodHwACdtlOhvILNJSMZl16Qj0yrF45ibEcgVJJ5Ssm7FBlZJtz8
         Sg/OmifYW9o2nfsagNOwwtOq2yCV4msCDxdyt9GV83Xbc2wuE9wqPqca6EWTXCT/XA
         ggOha6yiabMykAQIO8wlP3j2t5xfZhifV2rdgpMwftrRBSAuuyKBVq91hobfK3yjMD
         IlrWWfV5Bt3z4Rfzi0P+e88cEwDQRNVBHML8pLx0nEJC5ODra+ZT7dW1B8UmpZaQEv
         eSc6vVWCPKS8A==
Received: from [100.114.65.136] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-a.us-east-2.aws.ess.symcld.net id F1/70-05583-C4576916; Thu, 18 Nov 2021 15:46:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAJsWRWlGSWpSXmKPExsWSoV9jretTOi3
  R4MMUeYtJM/4zW7w5Pp3J4sDUacwWq/e8YHZg8di8Qstj06pONo/3+66yeXzeJBfAEsWamZeU
  X5HAmnH6Em/Bf8GKH+fOszQwPuPrYuTkYBRYyixxZa9iFyMXkL2IVWLahp/MEE4nk8Si7plsI
  I6QwBwmiW9/rrFCOAeZJB7tucYC4kgIPGCUOPDkFgtEppNRYvfWH1A9E5gkrh6aAtXzhFFiQ+
  tRFjjn1/ujQBkODl4BW4kXK8NATBYBVYmVjfUgZ/EKCEqcnPmEBcQWFQiXOLvqNjOILSyQJbF
  7/hM2EJtZQFzi1pP5TCC2iEChxOG7q1gh4poSz9o6GEFsIYEMiSNTZ4HF2QS0JbZs+cUGsopT
  wEqib4cOTHnr9t/sELa8xPa3c5ghWpUlfvWfB7MlBBQldrS9YYewEyR6/j1ig7AlJa7dvAAVl
  5U4enYOC4TtKzGzbyUTyCoJAS2JZc+SIcI5EnPnLmGCsNUklv6+xzSBUW8WkodnIXlsFpLrZi
  G5bgEjyypGq6SizPSMktzEzBxdQwMDXUNDE10zM11jM73EKt1EvdJi3dTE4hJdI73E8mK91OJ
  iveLK3OScFL281JJNjMDElFLkpLKD8ceXH3qHGCU5mJREedf8n5ooxJeUn1KZkVicEV9UmpNa
  fIhRhoNDSYLX13FaopBgUWp6akVaZg4wScKkJTh4lER4zzkBpXmLCxJzizPTIVKnGHU5Jrycu
  4hZiCUvPy9VSpx3NkiRAEhRRmke3AhYwr7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3K8
  gUnsy8ErhNr4COYAI6QvbyZJAjShIRUlINTG6LfKZtduaem66TyWXBwnDPYaphv+zT84XqJ/Y
  s/75bf4fGj+dHZqWYbkv59u3pprTblYfma6VM5fbT5C429Q4+kXVmnaJviEGDWrDe+gfr7XVk
  KsM0fr20jj4caiaqL/lG5dkDvqB6jgX170Wim9b23n9tYyikyOD6YF1i8Ysje1wvTbJPOvSop
  2JqmFmO425v+118ljtWKJyfOzvQO3ypbXzXyolM7FsOtqrEpr8QsfwVL2T9INVBd1rfTJmied
  o7BNWUz1QE+Xa4bes6tt1G4WHBsmLN1z1f1undCqteqGzq9/qI9gWDCXpG52svq3RbLsw7ta7
  oZGb7VdX0/cozX3V+tK9J2Fi5ZlmIEktxRqKhFnNRcSIAmkXRkFMEAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-8.tower-635.messagelabs.com!1637250378!215825!1
X-Originating-IP: [104.47.124.59]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7042 invoked from network); 18 Nov 2021 15:46:20 -0000
Received: from mail-hk2apc01lp2059.outbound.protection.outlook.com (HELO APC01-HK2-obe.outbound.protection.outlook.com) (104.47.124.59)
  by server-8.tower-635.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Nov 2021 15:46:20 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyzRsbMGsToSKVOqTkjJvaOghCnlyw3iwf+/Nb/QIOS8/Jo8wgDdpA0PJ0hajEXYKMjdNEXvZMz0SUQHfIpFsYFBuGpRSRTJ7pqci6atESNx0DeZ9wpF5ws69Zg0LVB5xRWIrauUuk9Dlba5TwTsJ7Y+/wTLK4I2kyEGCYCXOZD4QlsFgP2sDywtCj5r1KbW1oHt3AU7s5EPA87JWdERlF6hR2XNEB2ybJA8psZ1nF8kk7JsvCIbD8bPvM6PqZXrplDKN/CXPj19j4gRUhX0qvpAyx04IC+riE8Jr+fTPn5iGVOKmx+rlLYYrAXdT2K9bgMRxLSoChIDbQ63p+Vlsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8m+42UV1o3fYIrWev91YNBsTDLOyPR4A4h7wOE0IWvg=;
 b=dO05b0huXRIWrQJKJE7E2HhSToFBF/yXePHfsCx0K3zxKsXnnw0fy40FA6M1NJEKhEuBLwXQn8s/MpDvlSE1OIazHXqaHJsQI6zqhxFfPwhpZyEt84djwNqTv2+NS994HSkQKMuVg4KQBWVuDSSHp6mhYAszm5iAbqa/K4JH992vTqJXm8krOJnuZWk644r+YuRgL/vpASUEnEneliV05JKJ7KF4yffchNhFM87wJIQan3zqWOOyWrbvCKGWTrPYsEmXW2UdhDZ5EMrwEhwIvM98s/zA/7RqLC4RuH/3Dd0SF3tw7gOGEwqFuPWxSeDyQBMlWsS32AaH75obob3YHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SL2P216CA0102.KORP216.PROD.OUTLOOK.COM (2603:1096:101:3::17) by
 TYZPR03MB5294.apcprd03.prod.outlook.com (2603:1096:400:3f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.12; Thu, 18 Nov 2021 15:46:17 +0000
Received: from PSAAPC01FT037.eop-APC01.prod.protection.outlook.com
 (2603:1096:101:3:cafe::4f) by SL2P216CA0102.outlook.office365.com
 (2603:1096:101:3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27 via Frontend
 Transport; Thu, 18 Nov 2021 15:46:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; redhat.com; dkim=none (message not
 signed) header.d=none;redhat.com; dmarc=fail action=none
 header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 PSAAPC01FT037.mail.protection.outlook.com (10.13.38.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 15:46:16 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Thu, 18 Nov
 2021 10:46:15 -0500
Received: from [10.38.106.125] (10.38.106.125) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Thu, 18 Nov
 2021 10:46:14 -0500
Message-ID: <edcabc67-c1b4-6931-5e40-f64660a5280a@lenovo.com>
Date:   Thu, 18 Nov 2021 10:46:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [External] [PATCH 2/2] platform/x86: think-lmi: Simplify
 tlmi_analyze() error handling a bit
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>
CC:     <platform-driver-x86@vger.kernel.org>
References: <20211118114150.271274-1-hdegoede@redhat.com>
 <20211118114150.271274-2-hdegoede@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <20211118114150.271274-2-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.106.125]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e28c081-6429-46e0-013a-08d9aaaa8f12
X-MS-TrafficTypeDiagnostic: TYZPR03MB5294:
X-Microsoft-Antispam-PRVS: <TYZPR03MB5294B8ABA657FBADBA035EECC59B9@TYZPR03MB5294.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R81ZXdLTtt4iJUYqyKIPl8vx9HQJ0DC/OE92oHHELNukuK1Af+zBrNgB2p/gDuQt/0XgqMhNESZIIfA4wnDKnWyeqF+QXGDDjV+FGCoU1Fsg7czzVm9lEEJsNc2Jq8oDTK/cjXpwPShVtLu2R8rvPV+sPwFmTAywdE8HQTdaY3FEmXOny4zsoBbaM/4zE/K4Da0OWj6CRl+WBAk12pfuTrhkM/HNlOly7VAVsB438fzgAloAc5ze1SmgMMxnbEyy6dRkPMjLvfga2OkNs5btxotBhRhxHgr4yCtCT0NXHvScM9btKFqryViCV9upYU+JJnNU7KtIAlupuH7XHqrk/MLrX4TUjKiR/y5eDmmSEmJftGGek6plyMTpz4SlqMbZpnWzEC4sg1P+Bl1b5it8o36WlWWuBy98dxdTeQgo2lG6QsyT67pg/bWL26dJd2ME/nYxzv+AinOp6WFG8C24W/V8kr9P8rzdQ0/tmjwkMNRg4k+H533NAFWbyB26pTwXgJCMP4Sq5wr7yND8QOdCoHsCCMRCpzQsYoXHeeRaeYFYFvI+QoRzhkvoRa4jvarMmk5L7ii9Ap6lFVMgSajt8GkR49Fg0cuPfdSURj15P83nUCxg7g4Mvegplmz0AIpFXf9ePMTqAc28WnnCJJyvHxsTSRT01EQB4DwwjtKLdELaPe2TkDwo47QxjeHPtB3t6VHGke4GIYPMoiDF89Qeq17yIVzUT5OW9kuV2VpW+8pvodQqbkpM9gb5rxzjO+R+S+PtjjIaEjDOe1I2W72SFeqYcKZ85IafKzUsLFWgNaC+iJ7ijlpuMxKRjaeeb+NErjzXD04EjkRZtyGu0TH+wv117mIbSsqnn4CTIB/KS2o=
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(508600001)(110136005)(8936002)(356005)(31696002)(8676002)(4326008)(36906005)(81166007)(53546011)(316002)(82310400003)(36756003)(83380400001)(16576012)(26005)(47076005)(70586007)(16526019)(36860700001)(31686004)(336012)(82960400001)(86362001)(186003)(5660300002)(4001150100001)(2616005)(2906002)(426003)(70206006)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 15:46:16.6762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e28c081-6429-46e0-013a-08d9aaaa8f12
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT037.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5294
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Hans,

On 2021-11-18 06:41, Hans de Goede wrote:
> Creating the tlmi_pwd_setting structs can only fail with -ENOMEM, set
> ret to this once and simplify the error handling a bit.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/think-lmi.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 6eba69334fa6..27ab8e4e5b83 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -1141,42 +1141,38 @@ static int tlmi_analyze(void)
>  	if (ret)
>  		goto fail_clear_attr;
>  
> +	/* All failures below boil down to kmalloc failures */
> +	ret = -ENOMEM;
> +
>  	tlmi_priv.pwd_admin = tlmi_create_auth("pap", "bios-admin");
> -	if (!tlmi_priv.pwd_admin) {
> -		ret = -ENOMEM;
> +	if (!tlmi_priv.pwd_admin)
>  		goto fail_clear_attr;
> -	}
> +
>  	if (tlmi_priv.pwdcfg.core.password_state & TLMI_PAP_PWD)
>  		tlmi_priv.pwd_admin->valid = true;
>  
>  	tlmi_priv.pwd_power = tlmi_create_auth("pop", "power-on");
> -	if (!tlmi_priv.pwd_power) {
> -		ret = -ENOMEM;
> +	if (!tlmi_priv.pwd_power)
>  		goto fail_clear_attr;
> -	}
> +
>  	if (tlmi_priv.pwdcfg.core.password_state & TLMI_POP_PWD)
>  		tlmi_priv.pwd_power->valid = true;
>  
>  	if (tlmi_priv.opcode_support) {
>  		tlmi_priv.pwd_system = tlmi_create_auth("sys", "system");
> -		if (!tlmi_priv.pwd_system) {
> -			ret = -ENOMEM;
> +		if (!tlmi_priv.pwd_system)
>  			goto fail_clear_attr;
> -		}
> +
>  		if (tlmi_priv.pwdcfg.core.password_state & TLMI_SYS_PWD)
>  			tlmi_priv.pwd_system->valid = true;
>  
>  		tlmi_priv.pwd_hdd = tlmi_create_auth("hdd", "hdd");
> -		if (!tlmi_priv.pwd_hdd) {
> -			ret = -ENOMEM;
> +		if (!tlmi_priv.pwd_hdd)
>  			goto fail_clear_attr;
> -		}
>  
>  		tlmi_priv.pwd_nvme = tlmi_create_auth("nvm", "nvme");
> -		if (!tlmi_priv.pwd_nvme) {
> -			ret = -ENOMEM;
> +		if (!tlmi_priv.pwd_nvme)
>  			goto fail_clear_attr;
> -		}
>  
>  		if (tlmi_priv.pwdcfg.core.password_state & TLMI_HDD_PWD) {
>  			/* Check if PWD is configured and set index to first drive found */
> 
Looks good, and works well. Verified with modifying NVMe and Admin
password on M90n

Tested-by: Mark Pearson <markpearson@lenovo.com>
