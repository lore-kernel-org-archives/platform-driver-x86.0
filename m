Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9994FC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Nov 2021 15:46:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74B96613B5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Nov 2021 15:46:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbhKRPtD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 18 Nov 2021 10:49:03 -0500
Received: from mail1.bemta24.messagelabs.com ([67.219.250.2]:13698 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231613AbhKRPtB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Nov 2021 10:49:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1637250361; i=@lenovo.com;
        bh=j71vGyQJE3IlvLUKB2NXAcHUH0fJnXDKMDuOmYKDXzI=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=cF9lIt5prFZ71yvbJpmIMxXEzI/H5RM+hoEXoqgzSg/fLLMtQz5s4RUs+3ssQFtcv
         52b7wNP0XTcjMBvZwv226M4E0DnbMCc7ZK/8Ev9lD1OZCNnmgshWj0GguFs5bkCROF
         PRLRnO064P4HanT60e1ZpDQf8rKyRm2fXjWKUKpg9USV8Wl9GrgYiyAmgqw3D3Nh5o
         zDnFzvzAdXrMb6tQItsYggV0H7Df5Rz3QRJ1LS71ct7RqMYv/PbfoOMdDNQru5TW1e
         saKoj5+E5UODKnnw3SdwaCogy66A61P3iDg7GEMJcnvlpp8ahnBtTx9hYhj3rlIU6g
         C2yBV2xJWB/2A==
Received: from [100.112.131.86] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-a.us-west-2.aws.symcld.net id 50/1B-23067-93576916; Thu, 18 Nov 2021 15:46:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPJsWRWlGSWpSXmKPExsWSoS+lpWtROi3
  R4NBHfYtJM/4zW7w5Pp3J4sDUacwWq/e8YHZg8di8Qstj06pONo/3+66yeXzeJBfAEsWamZeU
  X5HAmrH1+U/2gm0iFfu/n2ZrYFwn2MXIxcEosJRZYt2r92wQziJWiXn7vrNAOJ1MEpPn3WMHc
  YQEZjFJvDp2ihnCOcAkcflFKyuIIyFwnFGi+9A6JohMJ6PEj1enWCCcCUwSX7+8gnKeMEo8bH
  yH4HR2twAt5eTgFbCVmD7tLguIzSKgKrHtzRNGiLigxMmZT8DiogLhEmdX3WYGsYUF8iSmT+w
  Gs5kFxCVuPZnPBGKLCBRKHL67ihUirinxrK0DbI6QgKXEkY23weJsAtoSW7b8AtvLKWAlcXP+
  c2aY+tbtv9khbHmJ7W/nMEP0Kkv86j8PZksIKErsaHvDDmEnSPT8e8QGYUtKXLt5ASouK3H07
  BwWCNtX4nbPU1YIW0tiXtsTqHiOxMopx6BmqkksaZ3BNoFRbxaSl2cheW0WkvNmITlvASPLKk
  bzpKLM9IyS3MTMHF1DAwNdQ0MjXUNjQ10zE73EKt1EvdJi3fLU4hJdI73E8mK94src5JwUvbz
  Ukk2MwPSUUtDssINx95sPeocYJTmYlER51/yfmijEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgtfX
  cVqikGBRanpqRVpmDjBVwqQlOHiURHjPOQGleYsLEnOLM9MhUqcYLTkmvJy7iJmjq2chkJx0Z
  Pd2ZiGWvPy8VClx3tkgDQIgDRmleXDjYOn8EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3q
  8gU3gy80rgtr4COogJ6CDZy5NBDipJREhJNTBtevL6o+uS84eqrFt592To8ufVu1Rt9F1mMTV
  P3P1fsdH1/LeVhsbHr7p8XdNnGO6xK1P7beXDUL/uo8Ubv7xIWvThYNCi6YcX7s8Rvsl9xP/w
  i+c/5nn2e1jteCdcptWp3veo+6P5Zeushpik3uQUqdWxc7PC5Ll6DuxTqBXfUFmj86a1bIHv6
  x+PE54sVdnJttrm4axqlhIPdSaLKpXIJYFScTYbJqf/FLVOLj637ept07CIhdKR7nef9OTU7H
  y+5vtCexmRfy91724/Vztvt13ai8+bDE7rvbvZpM2pdW/rUS+WRMPXE+epMt3ZNy163Yv3F45
  tZmGrWpA0j3++zYH7/aJx06OczCYJ3RJQYinOSDTUYi4qTgQAZcUBM2IEAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-10.tower-335.messagelabs.com!1637250359!36920!1
X-Originating-IP: [104.47.26.42]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4238 invoked from network); 18 Nov 2021 15:46:00 -0000
Received: from mail-psaapc01lp2042.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.42)
  by server-10.tower-335.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Nov 2021 15:46:00 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMlYJtzo6/dD5HMnN7xZzS45/6frQXFCedlxuV04u7ZwaqCzVnHfsKD8/D3JA1ZdtWpGI7hNogNsAwbsxWNPO3+FQlJV3X/zkqS476wnuy7SKqks7/GsTEZNGWXa7cYzuKs0uqL09J4B5OoXCMKAUTFQmxUfdysr5v7XTt+hHqFNNPjOeDJdMRRPLBKcc49VVRGc1h0rXexY/ZyXnBy2U8QDWypwVMbgAbDt8mwgd1TKwfVknMFtahwDyjvjo5XYN8yQCWNqM3kwYyyXyPm79id3aawsOTPjdLxM7yQ816TeFAAtP0F5rYVpvKr4TWE3Hc1Uxz5u7dvlI57UufTUkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j71vGyQJE3IlvLUKB2NXAcHUH0fJnXDKMDuOmYKDXzI=;
 b=L0wLZE4/by4f4ud8k8JA+OrC9a099Wt+HC3fU5dwEqcGz6FdDLEjtoXrG9KEOlwopwthwAlwN3X22fXkf1vo5PQuHkGyJGOpM98sHPEmn1ls3mKZYxr6UDZYdc5TmV/UGg9eA7HZUpIyK6siBOJbJ0pvDq9C7aU1ocUTPrpSUtC06iIg81nUwn4pzOcVyA68td2dpzbkCeG0gc2CrIbbJcXIRNm5IrfcZc4M98ftB5AhOffMqEswoW0dBfEQ5TiXazSeWnUPE8hH6EOBiXEFw6Rquk/efftolegREaU0oQce/oEj/+kSLWUPj2cteWRrR9YK5A5/7T5u3vFbS9/Zxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SG2PR03CA0126.apcprd03.prod.outlook.com (2603:1096:4:91::30) by
 SG2PR03MB3788.apcprd03.prod.outlook.com (2603:1096:4:48::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.18; Thu, 18 Nov 2021 15:45:58 +0000
Received: from SG2APC01FT0026.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:91:cafe::9f) by SG2PR03CA0126.outlook.office365.com
 (2603:1096:4:91::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.10 via Frontend
 Transport; Thu, 18 Nov 2021 15:45:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 SG2APC01FT0026.mail.protection.outlook.com (10.13.37.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 15:45:57 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Thu, 18 Nov
 2021 10:45:56 -0500
Received: from [10.38.106.125] (10.38.106.125) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Thu, 18 Nov
 2021 10:45:56 -0500
Message-ID: <55c76c7f-289d-e94b-ce2c-49ad93936fc1@lenovo.com>
Date:   Thu, 18 Nov 2021 10:45:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [External] [PATCH 1/2] platform/x86: think-lmi: Move
 kobject_init() call into tlmi_create_auth()
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>
CC:     <platform-driver-x86@vger.kernel.org>
References: <20211118114150.271274-1-hdegoede@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <20211118114150.271274-1-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.106.125]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0d19e6d-aaf7-404e-e520-08d9aaaa83d3
X-MS-TrafficTypeDiagnostic: SG2PR03MB3788:
X-Microsoft-Antispam-PRVS: <SG2PR03MB37886BA505BECF4F68BFC05BC59B9@SG2PR03MB3788.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d0b/v1S/13f9zhN8lrP4rQdpBlEDmzSN91TOf+PImm0vZHZqQn3Dc5YXO4tAHg7r/B+yFAw/t6qPZhmRCKwCf6HHQAAxF6gOYeCTcMkf/QYuYZW/b9ZPwiKXPUF4JdSnxRbbh7kiMomhTwoBx+8tpNigo5ln7KpU9h6WFcPzyyXoNjQsUSIn8t8kZSVrGmC9lLc448UZQ5IUg/mpHGnpUm0npl2bgl2zlKRsF/G0vqu2pyJp61KEnwlZvknkHQC8Cqqx7wQb1GM5zFs43ZHgLV1tdBWTd1kCT0WHIM2emCsxqRZ1Yq+oPIS2SpbR4FXSnwZ1SZd0NjZpYo7DCMNX/Cd0Uc22/20wXDoXDt1Qorn340V3H2JoVOsstkIG+Vovt5qEiokkOOVZBRodXwwmCR33otwlo0pIdElnSpEzcEFcbUbJ6fW0xL+NQSl8Umt83M8k3qjaSt/2IjfeeVF/MwVQRImwIKfAfaerSuGc/x1vfNfiMJeBsn7HgTBdjooTHXK8gTEgVfmU+HJ13G3GK/U+dtQE6fxUPmJBD1WBp6hW5VdT6NcbwJCS/zjMivzKwL0VY4lx6S4Nc9XOQu0P95f7HjD3P/BTHSfuZIK8/LMlUx3sV5spODAu927P6s5y3rrwaFnbWYyxSYQKov7/B5sknIl/IAKE+Jy5M8LJ5afniPSWFWaKRxdJtw7YDy4tQktXIGp62CxD+0+AmGz6x/rz/7dA+9UimyuVdJqhvVPqO5BmTw4+Ac6ufWf5r0OtpW7/5z/Oa4t7DKT8LSAoB1Af8+SDxAd+9tUZIr1C5K0=
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(4326008)(81166007)(8676002)(4001150100001)(53546011)(316002)(83380400001)(8936002)(186003)(16526019)(2906002)(31696002)(31686004)(5660300002)(36756003)(16576012)(508600001)(336012)(70206006)(70586007)(426003)(26005)(47076005)(110136005)(356005)(36906005)(82310400003)(82960400001)(2616005)(86362001)(36860700001)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 15:45:57.7243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d19e6d-aaf7-404e-e520-08d9aaaa83d3
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0026.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB3788
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Hans

On 2021-11-18 06:41, Hans de Goede wrote:
> All callers of tlmi_create_auth() also call
> kobject_init(&pwd_setting->kobj, &tlmi_pwd_setting_ktype) on the returned
> tlmi_pwd_setting struct. Move this into tlmi_create_auth().
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/think-lmi.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index fee9e004161f..6eba69334fa6 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -1057,6 +1057,9 @@ static struct tlmi_pwd_setting *tlmi_create_auth(const char *pwd_type,
>  	new_pwd->minlen = tlmi_priv.pwdcfg.core.min_length;
>  	new_pwd->maxlen = tlmi_priv.pwdcfg.core.max_length;
>  	new_pwd->index = 0;
> +
> +	kobject_init(&new_pwd->kobj, &tlmi_pwd_setting_ktype);
> +
>  	return new_pwd;
>  }
>  
> @@ -1146,8 +1149,6 @@ static int tlmi_analyze(void)
>  	if (tlmi_priv.pwdcfg.core.password_state & TLMI_PAP_PWD)
>  		tlmi_priv.pwd_admin->valid = true;
>  
> -	kobject_init(&tlmi_priv.pwd_admin->kobj, &tlmi_pwd_setting_ktype);
> -
>  	tlmi_priv.pwd_power = tlmi_create_auth("pop", "power-on");
>  	if (!tlmi_priv.pwd_power) {
>  		ret = -ENOMEM;
> @@ -1156,8 +1157,6 @@ static int tlmi_analyze(void)
>  	if (tlmi_priv.pwdcfg.core.password_state & TLMI_POP_PWD)
>  		tlmi_priv.pwd_power->valid = true;
>  
> -	kobject_init(&tlmi_priv.pwd_power->kobj, &tlmi_pwd_setting_ktype);
> -
>  	if (tlmi_priv.opcode_support) {
>  		tlmi_priv.pwd_system = tlmi_create_auth("sys", "system");
>  		if (!tlmi_priv.pwd_system) {
> @@ -1167,21 +1166,17 @@ static int tlmi_analyze(void)
>  		if (tlmi_priv.pwdcfg.core.password_state & TLMI_SYS_PWD)
>  			tlmi_priv.pwd_system->valid = true;
>  
> -		kobject_init(&tlmi_priv.pwd_system->kobj, &tlmi_pwd_setting_ktype);
> -
>  		tlmi_priv.pwd_hdd = tlmi_create_auth("hdd", "hdd");
>  		if (!tlmi_priv.pwd_hdd) {
>  			ret = -ENOMEM;
>  			goto fail_clear_attr;
>  		}
> -		kobject_init(&tlmi_priv.pwd_hdd->kobj, &tlmi_pwd_setting_ktype);
>  
>  		tlmi_priv.pwd_nvme = tlmi_create_auth("nvm", "nvme");
>  		if (!tlmi_priv.pwd_nvme) {
>  			ret = -ENOMEM;
>  			goto fail_clear_attr;
>  		}
> -		kobject_init(&tlmi_priv.pwd_nvme->kobj, &tlmi_pwd_setting_ktype);
>  
>  		if (tlmi_priv.pwdcfg.core.password_state & TLMI_HDD_PWD) {
>  			/* Check if PWD is configured and set index to first drive found */
> 
Looks good, and works well. Verified with modifying NVMe and Admin
password on M90n

Tested-by: Mark Pearson <markpearson@lenovo.com>
