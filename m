Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107B2C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Mar 2022 17:14:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239128AbiCIRPo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Mar 2022 12:15:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237292AbiCIRM7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Mar 2022 12:12:59 -0500
Received: from mail1.bemta35.messagelabs.com (mail1.bemta35.messagelabs.com [67.219.250.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2851625C49
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Mar 2022 09:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1646845652; i=@lenovo.com;
        bh=0BPgwSaistS+Od67voGRKh5M33F+md9a+DOt8vF31FQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=HXQJF3wIu/UhA6tITsBOJcmgVb4agS08L1HtGT/gNMkQuc14wkAotQ43A8uEZVBPg
         75b065BEsECbjrMN0BztHp+Ghp9drLmQtMZE50TBWolnYEU2YExvQxoeZCU+KZ4+GU
         leD8IpacqphEapd1/1zDTs9Aa6+Nh0FD/RlxOIybN7RefLVSXhRF9FzmvMIQC7qNoR
         T92UGhMh0D4XTuSNJmItZ4EHI95zUDGNA4yXMXGFf/plVHgnGVBnr+VPeBlJy+2RfM
         +AvnAK5huUiyjXAPLq3O2M9c8MoQ/3D3WPI7Iimi2fk5H4k2SPA9oh+XfKMTlOmqdB
         fgbqUa8B/JyAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHJsWRWlGSWpSXmKPExsWSoS+Vq3v5nka
  SwexT1hYHj2xks3hzfDqTxavmR2wWB6ZOY7ZYvecFswOrx+I9L5k8Nq3qZPN4v+8qm8fnTXIB
  LFGsmXlJ+RUJrBlb795jLbjGUfFq7X+WBsa17F2MXByMAkuZJR6dOAnlLGKVeH3sHxOE08kks
  ah7JhuIIyQwl0miY/VqdgjnEJPEiydXgTKcHBICxxklule5QyQ6GSV2b/0B1dLHJPHl6RSwKi
  GBx4wSXaej4OyOi5wgNq+ArcTurnYWEJtFQEVi3e5JjBBxQYmTM5+AxUUFwiXuP/sMNkdYoFy
  ie+JWsBpmAXGJW0/mM4HYIgJ5ElNnvgKq5wCK+0j8nJ0NYgoJWErcX5YBUsEmoC2xZcsvsCmc
  AlYS09t7oaZoSrRu/80OYctLbH87hxniSmWJX/3nmSF+VJRY8f0c1L8JEs1TjjJC2JIS125eY
  IewZSWOnp3DAmH7SjSeX8cEYetKvPx4hxXCzpFonrEaao6cxKnec0wTGHVnIXl4FpLHZiE5bx
  aS8xYwsqxitE4qykzPKMlNzMzRNTQw0DU0NNG1tNQ1NDXTS6zSTdQrLdYtTy0u0TXSSywv1ks
  tLtYrrsxNzknRy0st2cQITFQpRclzdjDO7v+pd4hRkoNJSZRX6IBGkhBfUn5KZUZicUZ8UWlO
  avEhRhkODiUJ3hOngXKCRanpqRVpmTnApAmTluDgURLhXXkeKM1bXJCYW5yZDpE6xWjMcWXb3
  r3MHOd37t/LLMSSl5+XKiXOe+kuUKkASGlGaR7cIFgyv8QoKyXMy8jAwCDEU5BalJtZgir/il
  Gcg1FJmHfRHaApPJl5JXD7XgGdwgR0ip2RGsgpJYkIKakGJp4LvnqNZ1Z6PZdO/vBR8obOe/H
  H8gU819RTl6y+O5k/8L9XQnHdge6tEmfXyPtLfPK1ujKNT7SXSe9M8ZfMGfw33h+ff2BLrLnO
  qk17/Jvdn2436OM5PE919c3O+08EEk/M337zvfLV41/utDGfzOtckssl2ea9QuZKeQLvp3P77
  EtdbiSL8rOe0l51x+SFpXPxA4OCwzJaas0rQ/d9Wuyg/HCxvlqiSe+ati/yASsKz8x5+T5i6k
  Ye0Zu/8jdzCj45vcnD33a6nGNwZs3nafK3bu6808skwVinW5i6sfFYYX5pCKt9T4de65FX5h7
  L7669oxJ9yv3wyu6b5+bziPLliNw5e+T7hNN7pRcqaSuxFGckGmoxFxUnAgAEZwfNYQQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-10.tower-655.messagelabs.com!1646845650!12230!1
X-Originating-IP: [104.47.26.109]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18340 invoked from network); 9 Mar 2022 17:07:31 -0000
Received: from mail-sgaapc01lp2109.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.109)
  by server-10.tower-655.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Mar 2022 17:07:31 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPEsntVKK8NERY0kml34VS67OGa/QTYWcPB75t9MFTcFVpHIdKlxNUkg5JYHK7c/W6s8R1nEK7W+Uyd0zpetC08duywtXIEt77ocKJxRtzFkhRwTv8Hi14RoArrrRJsr4zeqVMLBdh9d25njD6ZbyxEhGhtQ17OGP/L3Cejc4JU/ijV9VZCOZ5Gas1fBwz008TFbJV0fzwmhm4zRS6sJ5da3N+DsCUI8W56e7PyeyTlI2utZGPsltE1C4niqqekLy7/OzWWXDgmD+hvBjdmaGsZmCK7f52EE6ka9lhiAx+QV8zpzLUMrOaq/dyJtQBIgKnSxWWYNh3dVxfmqXcECBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BPgwSaistS+Od67voGRKh5M33F+md9a+DOt8vF31FQ=;
 b=cms1Mmd8D/YTAiuHsAwdQjvLU3+P4tYNXMgh0NVAqQBoJypmgF2RioD7KVe7bjXStBiwzr3APBkN6e3iuVsJGOS7aHODQunOMulrFKYr8mIdZGA0jfna2CeahOFejP5697m6KMA793yz9yrVqUZCs1aK/sArx9HavBM9BzDyXNq9dbC4hgUQCl8rWoMjWQqJ0YzkHOcbz0Tt5xbD34E3QVW6HRi2fjcprCw4Vq/sUg1uxR6W4w3fe9QMoc8PmE4zQvkEfDkS1Z4A3jMnT7c9TY/dDuNCsJtAZByHIUOpNajxo7bfS5IXaiKM9eb5B/jWavtgW2svTLIzZ8JBDK2KNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PS2P216CA0078.KORP216.PROD.OUTLOOK.COM (2603:1096:300:2c::16)
 by TYZPR03MB6189.apcprd03.prod.outlook.com (2603:1096:400:12d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.7; Wed, 9 Mar
 2022 17:07:28 +0000
Received: from PSAAPC01FT011.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:2c:cafe::e3) by PS2P216CA0078.outlook.office365.com
 (2603:1096:300:2c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Wed, 9 Mar 2022 17:07:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 PSAAPC01FT011.mail.protection.outlook.com (10.13.38.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14 via Frontend Transport; Wed, 9 Mar 2022 17:07:27 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Wed, 9 Mar
 2022 12:07:25 -0500
Received: from [10.38.104.226] (10.38.104.226) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Wed, 9 Mar
 2022 12:07:25 -0500
Message-ID: <d515fb57-0fd4-5891-0a8c-d252bcb6413b@lenovo.com>
Date:   Wed, 9 Mar 2022 12:07:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [External] [PATCH 1/2] platform/x86: thinkpad_acpi: Fix compiler
 warning about uninitialized err variable
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
References: <20220309170532.343384-1-hdegoede@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <20220309170532.343384-1-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.104.226]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50a6fc50-8d65-49cd-f6b5-08da01ef4a29
X-MS-TrafficTypeDiagnostic: TYZPR03MB6189:EE_
X-Microsoft-Antispam-PRVS: <TYZPR03MB6189DB4C818F412B8E0ED5F8C50A9@TYZPR03MB6189.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K4bFcqD8ihCBXvVsuO7G49RJh+HAmpL5RYSZrIXOGvcbjZqqVfkNsi8tbmc4VvWOvEcjCgqdBIKgLEUSwSxhqPb0tVOi7iJfX5zWwA+9BHOGlQV84nSJ/z42prM86+FxkdGNzqql0M1w9CZtHXHR8N6/F+4pkPAWdDo6GkR4Wnm6DpT7W4/p3kFLF+IRmjb68avhtYbFDTXGP6g6xifk2vjPGMcojgLW/YmxdvrLhpuM3+eiD7sm4p5BP9hpcKxxfm/eE7wOxuGsCis5I2DfnWlPuFJ6RT3U1ElUz5OHCi3tCFTBiSB/dKG3KrSwapmYvjEdcGa7Vxib8S8qGm/ONkOlZqqbnQs2S134yVLZE7NiU+/jytBjHbkhBwqxsW+hqiHmKKP8R07cnGSyz8om3cxe+eAhRX1i6oy5k6Ib+sJBLwpAcM9Oicvhqie/uJKVp3RW4Q8CzuuFjtz72hSlu2izxbGgbzCwDeh2uxwPowxZ2CNdbYrUFgdD0VYfXM+78zzLFzQ4YlFonTuMavbG6f1CAp4dPuSQMWXFxeu1f1DPiknLccOHpMzmkxCmVAZN/oCWQR6b/guu9qPxaVKIvCFcwjNDmKzTEPUKao99wGuv25mr95BOBr10e81hoVYmhbZvMWngnUnzsacTclxXqHEiCWkPi3efqah/wlL5ysnBWX9kepIXQmzNYeOxVGhPx0vOQ7hjD69Dz9oxkVFucGTMTxQEgLvWPWP6e6MlET0uSfZrGpKV7AyXvBV4dHb0VLt8k5rS0hYwVUCIjrwWcgE8wEu6EDK+vS3ixWdCNyEh9tDOqXHTdS602pNRoW0k
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70206006)(86362001)(2616005)(82310400004)(8676002)(16526019)(26005)(336012)(426003)(186003)(47076005)(53546011)(508600001)(31696002)(16576012)(4326008)(83380400001)(36860700001)(70586007)(2906002)(82960400001)(110136005)(36756003)(40460700003)(54906003)(36906005)(5660300002)(81166007)(8936002)(31686004)(356005)(316002)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 17:07:27.5047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a6fc50-8d65-49cd-f6b5-08da01ef4a29
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT011.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6189
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Hans,

This was on my todo list but appreciate you doing it so fast :)
Change looks good.

Mark

On 2022-03-09 12:05, Hans de Goede wrote:
> err is always set because if we get here then dytc_profile_available
> is always one of DYTC_FUNCMODE_MMC or DYTC_FUNCMODE_PSC, but the
> compiler cannot now that, so initialize err to 0 to avoid a
> compiler warning about err being uninitialized.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index cb8f52be8253..7016c7fc3440 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10344,7 +10344,7 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
>  static void dytc_profile_refresh(void)
>  {
>  	enum platform_profile_option profile;
> -	int output, err;
> +	int output, err = 0;
>  	int perfmode;
>  
>  	mutex_lock(&dytc_mutex);

