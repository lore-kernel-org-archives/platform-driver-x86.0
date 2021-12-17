Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA21C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Dec 2021 14:17:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237055AbhLQORo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Dec 2021 09:17:44 -0500
Received: from mail1.bemta33.messagelabs.com ([67.219.247.4]:45149 "EHLO
        mail1.bemta33.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236999AbhLQORo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Dec 2021 09:17:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1639750663; i=@lenovo.com;
        bh=98nc+1OGbHfZooAwPhay55LOoH6btmZ0NhjPClRkxG8=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=V3iL6z2NldqY1d9d2UL/dPs48iMFnlG1yNy/fXbk9/D5ULpWXamEgOwlc+ebW7y2q
         Az69BvFe83vFhE8UTLnehjfi784dPdGMXAAPSmbVJzx9Jb1HD0HxgylToPcvPUqXKI
         oi4RrDZnlLf2rc4RrtR3BtOJGGvG8teyJPn9b9z2bIWkCSboaZH1NnAWGXdzMDwYRz
         7Tjbvy3bbS+S3IkcS1MLE20FmQZvdqvvKFORXVxHc39p1YjMfQ/WYprC3FhMuTr3NA
         I+vIWk5OCugJgcb1iz0VJSNbYGlAi4foWC6OW5GpdOF4sQeYdXiYCW710gw9FokB/H
         nTa8GKgw6G/YQ==
Received: from [100.114.67.184] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-a.us-east-2.aws.ess.symcld.net id 1E/EE-32326-70C9CB16; Fri, 17 Dec 2021 14:17:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKJsWRWlGSWpSXmKPExsWSoV9jpMs2Z0+
  iwatX6hav/01nsXhzfDqTxdZb0hYHpk5jtli95wWzA6vHplWdbB4fn95i8Xi/7yqbx+dNcgEs
  UayZeUn5FQmsGQe2TmMuWMlR8XHfRKYGxu9sXYxcHIwCS5klXh/ognIWsUr8On0Dyulkklj0+
  CsjiCMkMJdJYuqfQyxdjJxAzj4miaNHHEBsCYHjjBLdq9whijoZJXZv/cEGUTSRSWL/XHmIxB
  NGiU1T/7JCOA8YJU7/PcrexcjBwStgK/HobS2IySKgKrHhRABIL6+AoMTJmU/AlokKhEucXXW
  bGaREWCBQ4shqY5Aws4C4xK0n85lAbBEBHYnLnT/YQaYzC0xllNjy6g47xA2aEjN+TQKz2QS0
  JbZs+QV2G6eAlsTm9TuYIAZpSrRu/80OYctLbH87hxmiV1niV/95Zogn5SWWduxjhbATJHr+P
  WKDsCUlrt28wA5hy0ocPTuHBcL2ldgy/zzYzRIC+hKvPwRBhAsktlxZDFWuJrHm/HrmCYx6s5
  B8PAvJa7OQXDcLyXULGFlWMVolFWWmZ5TkJmbm6BoaGOgaGpromlkCkV5ilW6iXmmxbmpicYm
  ukV5iebFeanGxXnFlbnJOil5easkmRmCKSilydd3BuHbVT71DjJIcTEqivHq5exKF+JLyUyoz
  Eosz4otKc1KLDzHKcHAoSfAmdAPlBItS01Mr0jJzgOkSJi3BwaMkwvt4IlCat7ggMbc4Mx0id
  YpRl2PCy7mLmIVY8vLzUqXEeVNmARUJgBRllObBjYCl7kuMslLCvIwMDAxCPAWpRbmZJajyrx
  jFORiVhHkXgEzhycwrgdv0CugIJqAjwpN2gxxRkoiQkmpgsmdaf1xr54mpr291pO9yMa0+Ibh
  /4w6NnstvA5Wnbt9kcrdN6knZMmMXgykX3xVonfXt07vbaMTDZL5YYXHawYfXV8guOG2j4f/9
  x8/af/He1xT6Qv38VnkkNroK3RepKFofflJbbmnhyi2PL2jPW7nJZ4LqyzSZw2bVhzgVzYRiI
  1JM9l3Qye//I86j22/Z9ie49s2hkumLF6e8kFukLZ6iv0gi0Tqzrd/4XbGaIofBlcXt605VM+
  76dfSE9fr7lx7cffrhmcdEUV6h200/fsyb4ryxiV97hWObo2pEwannU45u0XHY/StXU2Ljo1s
  Lt36fuan8DEeYbq3EjQnbzNzlltkpfD38asEnyRNPTJVYijMSDbWYi4oTAT3Zh/ZYBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-2.tower-635.messagelabs.com!1639750660!13512!1
X-Originating-IP: [104.47.124.50]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21855 invoked from network); 17 Dec 2021 14:17:42 -0000
Received: from mail-hk2apc01lp2050.outbound.protection.outlook.com (HELO APC01-HK2-obe.outbound.protection.outlook.com) (104.47.124.50)
  by server-2.tower-635.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Dec 2021 14:17:42 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeSds3A11qCa/EcJJkMIm/8g7fUGuK1Asfk7l6ktu9U0zzYIeCmYQAf2z+R6guSpYnV4pAoRtgUs8yh6uMv7Wg5EdiN/hBOGRIMblVhdMMbITtP4rYNumRoc+68DH05fQwJtOYbhmex2UIycVn6mp2dFteDX5Uaz7v4tv9ytg4RCjRdjDhBfm3UFVkkyO9lQOl+YnTsCNji9NDNikA1Tjw7BnEPgYnZKFuPadMjWNojcd9qg6GxY/txe3pSAxhggbjPWPDJmMFuoKzjw0+PDxSTKAEA6Edm1uTMj3dZNY8P/Hzhf6Go+PI9h1AXJCiOzO4l4T2K1Z5iuDuoW2ypvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98nc+1OGbHfZooAwPhay55LOoH6btmZ0NhjPClRkxG8=;
 b=dLFXUgf/sE0qKXZ/00X17XZ5MO8rDP3rHzN/3tRT7IykKvhO1/0s4eU5kKxwDiv5iEh3TrkbyqabWLRAI7uOh+jgjY36dz4SoAVok9/cDzPFUABrp22H9HljWQ/jowjDweZAGQH8dyIJsmGtZzjxpmVFiUsgeEQytfOB44WsL5nhlvAPLo73zjHpe3TpeUfFOMpnKU5HQJG8OjCEL1b+nE4V0+b/Z4uq6XwjvdGfX0VmbatEto9H8tJICqZbweR9o9yRl2BRjQoXOqrFFJtz9oltgNb73jO5jXyOQaSc4AIbwNzy5jOaR0/yJYM/5ESq/3feQm6ZLuLUFrjZIC6pxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=oracle.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SG2PR03CA0127.apcprd03.prod.outlook.com (2603:1096:4:91::31) by
 PS1PR0302MB2489.apcprd03.prod.outlook.com (2603:1096:803:8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.8; Fri, 17 Dec
 2021 14:17:39 +0000
Received: from SG2APC01FT0044.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:91:cafe::3) by SG2PR03CA0127.outlook.office365.com
 (2603:1096:4:91::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.7 via Frontend
 Transport; Fri, 17 Dec 2021 14:17:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 SG2APC01FT0044.mail.protection.outlook.com (10.13.36.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.13 via Frontend Transport; Fri, 17 Dec 2021 14:17:38 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Fri, 17 Dec
 2021 09:17:37 -0500
Received: from [10.38.50.31] (10.38.50.31) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Fri, 17 Dec
 2021 09:17:36 -0500
Message-ID: <3d96992a-c587-9490-7646-bddf9c7d62df@lenovo.com>
Date:   Fri, 17 Dec 2021 09:17:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: think-lmi: Prevent underflow in
 index_store()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20211217071209.GF26548@kili>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <20211217071209.GF26548@kili>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.50.31]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f85016ef-d4b1-460c-8e55-08d9c167fb7e
X-MS-TrafficTypeDiagnostic: PS1PR0302MB2489:EE_
X-Microsoft-Antispam-PRVS: <PS1PR0302MB248959326AD5F6A7D999C3C5C5789@PS1PR0302MB2489.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cENt6NaaAtvP3hf3jiLP0HOR3Gbq25bE0pKctQP6Yyaeik9MAOosUJdmyBDReE5jfEy2BTjx501df4wtOHvl4+UrJ7B74+wou7c7+VzNsh0U8OyF596Gn3qkrsjEKPbhq7jkgx6K/fLW/RIIKamGEfUDp0UxKtIcnlgyPafB+a3KuvSUQlkFkO0+EUZbLmHi1ZNN3B83TtRymu3nTKGpg9AFiQT1GNjeHjedJhElGt3mCn0VNM3e5Zx4valAxE/Oybjd7mXrZaJx803sJnSwlRgp3UrgtQXyu4Z4/3lLtwMLUwteiW3Qhmu9G0qI0LRAO1UDrYwjg27Pc4lxLVbdgqNeo/r5QNvmpSGZC383/MeNIAcaf75MEwqPk/7G8WlKEjmwKLaLAAXHyjkLU/yRAJ/rL4Xe/mDMWn2IIcOSGY/zvdw6PaBCJPpqM+Uq55bQE8UzEDNhynI5o6+dM8fERUjcqsfdhUCIHQr19CMPJMLP0qAOD8RnwcS30tojqo4rr3gXmA4XGWAnSDFaXz/cRq8C7wwtwjfO1kAYKNxNnA0IaMi/WlhlQAt7UiHUZ4umPYrgRX4JvhLlFllky3AvaupAdo8RxNfQB8V8IOkJRPGR7qP/Yc7tfd8fbYLiOt5LKYrfxa084vpIrvKvCyTdM7oJ3oqyxMezqFzMTCZQnd1ErR5EGbnt8nj5zfAu373VrGELvv4db+eYTRFcpZ+8spn4nWD9TbGfkGWdBzB2XLt0c+evcU9bHI2lPwaZLEzUIOwZ83O7LwH3qj3CAs/NyV00AURsfWbx8dFjOErNgtLhBt02pTSw3k+FrHCeFKmp
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700001)(47076005)(16526019)(186003)(26005)(82310400004)(83380400001)(426003)(70206006)(4326008)(31696002)(2616005)(86362001)(40460700001)(4001150100001)(53546011)(356005)(316002)(336012)(508600001)(81166007)(82960400001)(2906002)(5660300002)(36756003)(16576012)(54906003)(31686004)(6916009)(70586007)(36906005)(8936002)(8676002)(36860700001)(3940600001)(36900700001)(43740500002)(20210929001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 14:17:38.9491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f85016ef-d4b1-460c-8e55-08d9c167fb7e
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0044.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0302MB2489
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Dan

On 2021-12-17 02:12, Dan Carpenter wrote:
> There needs to be a check to prevent negative offsets for
> setting->index.  I have reviewed this code and I think that the
> "if (block->instance_count <= instance)" check in __query_block() will
> prevent this from resulting in an out of bounds access.  But it's
> still worth fixing.
> 
> Fixes: 640a5fa50a42 ("platform/x86: think-lmi: Opcode support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/platform/x86/think-lmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 27ab8e4e5b83..0b73e16cccea 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -573,7 +573,7 @@ static ssize_t index_store(struct kobject *kobj,
>  	if (err < 0)
>  		return err;
>  
> -	if (val > TLMI_INDEX_MAX)
> +	if (val < 0 || val > TLMI_INDEX_MAX)
>  		return -EINVAL;
>  
>  	setting->index = val;
> 
Agreed, it's good to have this check.
Thank you
Mark
