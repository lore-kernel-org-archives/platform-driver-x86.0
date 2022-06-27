Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D460EC43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Jun 2022 14:43:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236271AbiF0Onm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Jun 2022 10:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237854AbiF0Onl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jun 2022 10:43:41 -0400
Received: from mail1.bemta31.messagelabs.com (mail1.bemta31.messagelabs.com [67.219.246.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8104D6429
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 07:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1656341014; i=@lenovo.com;
        bh=8PmSVLZufsS/7gjjVT17cJw0D1ApgVQkNH///Ex026w=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=nE+2P3Zkp0blawAwBxf0HRd0MMn/jap4b+ZugT2/q8me+xuTgjg0bHtBTDKXhWTQt
         Bymoq9uWgCVQNrXoTw13b8N/y+6aMP6zY9dd8sycB+7NsU6w+W4rHatqMeNMQSuBBS
         19QLWO2cdroKJrW5hAfYA8qC/BYZtUW38vzW3KgxsLVAmxrDBLQhPBMVFU9Sts+FOA
         0bpvF7siXT1/CzBcf/AmEHSl0ikzpcPjk4UjMuUQePfnnH0uuFbf7mxpSY22j7w39A
         NyzN/ytFZLFBO6Nvp9RFz/VIM2qqn0tPaOJyn9nu8mNeZfnYuk9xrCoE5XEgYU5VGG
         HQKE06JGKebRA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFJsWRWlGSWpSXmKPExsWSoZ+npSt2aGe
  SwY+n/BZvjk9nsjgwdRqzxeo9L5gdmD02repk83i/7yqbx+dNcgHMUayZeUn5FQmsGWe3/mMr
  uMNfsebjCeYGxoc8XYxcHIwCS5klXq3dzwzhLGKVeD/hLTuE08kkMXnePTBHSGAek8SmxxvZI
  JwjTBLvry8BcyQEjjNKdB9axwSR6WSU+PHqFAuEM4lJYsGxuYwQzhNGicMtk4DKOCGc2WeTQW
  xeAVuJm5fusYDYLAKqEn/nXGKCiAtKnJz5BCwuKhAh0bv6BSOILSyQIbGu6yAriM0sIC5x68l
  8sHoRAXWJqR09QDdxAMUdJRoO8kHs7WCUOHt/FVg9m4C2xJYtv9hAbE4BO4kn9xawQ8zRlGjd
  /hvKlpfY/nYOM8SdyhK/+s+D2RICihIT1m9ig7ATJJqnHGWEsCUlrt28wA5hy0ocPTuHBcL2l
  Vgy6w6UrStxePZ2JghbTuJU7zkoW15i58bbLBMYdWYheXkWktdmITlvFpLzFjCyrGK0SirKTM
  8oyU3MzNE1NDDQNTQ00TXRNTIw1Uus0k3UKy3WTU0sLtE11EssL9ZLLS7WK67MTc5J0ctLLdn
  ECExIKUUsZ3cwtvX81DvEKMnBpCTKe237ziQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErys+4Fy
  gkWp6akVaZk5wOQIk5bg4FES4b2zFyjNW1yQmFucmQ6ROsXozXFl2969zBwPTpwEktfWL9jHz
  DF19r/9zBzLweTMr20HmIVY8vLzUqXEeZMOAI0QABmRUZoHtwCW5C8xykoJ8zIyMDAI8RSkFu
  VmlqDKv2IU52BUEuaNA7mTJzOvBO6OV0AnMgGd6DdxB8iJJYkIKakGpkkVf/R0ud49SOk137y
  Dk2l94eLD3L8W72MpWSF068epZQkJOm+kzvy5WX1dvzp04nHj7flhi4+8OlyXkNsyYf7V3IWO
  d3fPYpWMNDlhmnsiMK/aWVnxUfSz+n+x7rmTL+dflT7RntnAHqur+a/3ZVZwsFhPmHVb0qmyL
  SudPhy41tXqaDT5peiCi2+3VF5mvRaecjtPZGvUlaZtX3z25z/9YKbWrNazvP+27Ney44L7zL
  c86LRJPxrbLahZEX37gliDf3hAcYXldN6mLq//7Asfr+0SvLBo98alkna3VMsCtfwF1l6PMz2
  dOOn4U3mND0yfCy0ZJhmLPv3dHNC+UoAv3bHNcH/Jwq82a9zOKLEUZyQaajEXFScCANllHS1t
  BAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-16.tower-706.messagelabs.com!1656341012!331021!1
X-Originating-IP: [104.47.110.42]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7743 invoked from network); 27 Jun 2022 14:43:34 -0000
Received: from mail-tyzapc01lp2042.outbound.protection.outlook.com (HELO APC01-TYZ-obe.outbound.protection.outlook.com) (104.47.110.42)
  by server-16.tower-706.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Jun 2022 14:43:34 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuRO+qCdA7XbSh/XQ8KZ+uidh/9GsqOxbLsAJtQxLDCbjljQH3ZPJ5pl6hml0MyvBWMpYCH8EKeYPNVVOCkVkUZya0Jj0SbA0+YgbJfGusUztDbJMR3wQQjbJGHmZrMpk35FyXdAzMnMT19uus6N1Fv2O9SdIaq22kUokyAAnVx7sGrbTWv5vcmQ18VlsJp1dqE/+1zYI/2o9ylDba0sbCqW0Asj1DpR0u0WEfqJvkr/ghUyHWaJFfgnk/iIfXgqj35sUJaqK8XtJpzWPvoIDRNoFeVn+kAJFtkBqxr7KxSDGk969GFRTI9tKc7RV2JikO8JW5FIqiSM7KOWCi9sbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PmSVLZufsS/7gjjVT17cJw0D1ApgVQkNH///Ex026w=;
 b=HHfiAb+KS8+PCyr1p2QeFSi7r6GsnDZkWz86vT5W5hRKTqGxgb8viUUPlicvnEWqgbaC/YibBgNbKkEkuKHZAWClpfwdNhV8ggQSW0W0YieKHkGdaLn0q/4DErUDMlKcqrXgJiO4+MxHNTlo9BBHFEFdH2MLtpQRrg9KFyoIMVz7X64XkXXanpAYfs1/bGLo6HlxReEI+VqGYMNrWw+cA0y0dwc3MK3WTZDSnAbFPJVMe1bY2WOQcewvOhUbvDw5Nha6heO9mx7+KDywkLDkYPKPl1IIdqPsvpUFjtKvTJuJNJH31X32PIpnvdqgrHYd/OIfFS26OczIQf17eKF81A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from TYCPR01CA0166.jpnprd01.prod.outlook.com (2603:1096:400:2b2::6)
 by KL1PR03MB6349.apcprd03.prod.outlook.com (2603:1096:820:ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.11; Mon, 27 Jun
 2022 14:43:30 +0000
Received: from TYZAPC01FT057.eop-APC01.prod.protection.outlook.com
 (2603:1096:400:2b2:cafe::1d) by TYCPR01CA0166.outlook.office365.com
 (2603:1096:400:2b2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Mon, 27 Jun 2022 14:43:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 TYZAPC01FT057.mail.protection.outlook.com (10.118.152.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Mon, 27 Jun 2022 14:43:30 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Mon, 27 Jun
 2022 10:43:27 -0400
Received: from [10.46.214.159] (10.46.214.159) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Mon, 27 Jun
 2022 10:43:26 -0400
Message-ID: <e954a0b5-3601-9da9-3cd6-0d9b06df0d27@lenovo.com>
Date:   Mon, 27 Jun 2022 10:43:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [External] Re: [PATCH] platform/x86: thinkpad_acpi: do not use
 PSC mode on Intel platforms
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <markgross@kernel.org>, <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20220622181329.63505-1-markpearson@lenovo.com>
 <e134b37f-6618-d3ad-7de7-3b376c30a16c@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <e134b37f-6618-d3ad-7de7-3b376c30a16c@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.214.159]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31ae7737-3fa2-41b1-fa9f-08da584b675d
X-MS-TrafficTypeDiagnostic: KL1PR03MB6349:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iPooxoALU5/HGEDOVKtDF19ueiafg+UrdAP0wUd7HMIiTF4Y5mOOSt0Hh8lzIapDwmBvx9Q4+UrubHf13LdXEdh6ydzh+mu/mT+9uQxo6mhukq54IQ5rgFOU8gmoQSUj6VInXZuwA/3jaJ5o6VkEVbMhW3UPbozBDCcKi66k+nSom4KUpIQekMDTtkpq4XQxBnkvqzmah9N5EkNXldXQ6FQPVwq7Ub1A13JgExd3bjp3LwcmPG8i0aZybJsz19vPmTxmdwMssbrop0fctKxd0jkPip0fUv+Z3CMIAgcJpMbCZKTuAYrluzVDicaS249K1TRA9MMtjQ0Uib1lE5FGckCiWL6k5RUTx+GWJqfYfDxVg7TthuFIusVDEs19dL6Lo80ZAJa1y4sC7wE5inzMO4zZPyDLwh1HZPHNmBUhkM/C7yg5EdHJcdmSfBTYkiWVxZ0OSjrmP+mf54lCbNyvLcDqkfSfZhgCsGfiH/Zslaa532zziINIGVHKABnRZL08cnFtnGRV9IAd4rqzR1+gd4bqdCH4LHc4hhhf0F4BtiNfgaxKOKjNRGl4GVxgoxJXQnH4AOiA0yD1rDRzZ8ri6UOlUzkJ0wFYHmERURw+1KAw+uSm1OGzfdVr+FHg0adiV26URzDdtNMBmDEYbcOfEvhyCnIw9JrdEMFvxE5vipehW9b8gW/ptgAx1YpqXWf3jRQcayq5Sn3/Y6hRxAK43oYwXO+pSszwBZemf87OS4p9IYz7X9FKudA/lI1RYk9dGxPx8xJN0izLmFbL/XR5eMY12dTgg21l3IHI9CzbvgPw0x88bd9/kIB8D4SXjCvxmnu14glf/Cm+1p4KvCo9jOpH2rOj91+0tbOzlTAYIHPJULb5U+z3ZAhJxt9o93IpSiKKU8GqJHeGAlz5+EV1MYN/sR8W8FGWtT3mdEyGtWX5G5765gyxhgozYy63Uu1+
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(136003)(40470700004)(46966006)(36840700001)(426003)(70206006)(5660300002)(336012)(54906003)(40480700001)(2616005)(16526019)(6666004)(26005)(41300700001)(82960400001)(82310400005)(316002)(40460700003)(47076005)(70586007)(16576012)(31686004)(186003)(36906005)(36756003)(6916009)(81166007)(86362001)(8676002)(4326008)(82740400003)(8936002)(2906002)(478600001)(356005)(53546011)(36860700001)(31696002)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 14:43:30.2444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ae7737-3fa2-41b1-fa9f-08da584b675d
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: TYZAPC01FT057.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6349
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


Hi Hans

On 6/27/22 03:52, Hans de Goede wrote:
> Hi,
> 
> On 6/22/22 20:13, Mark Pearson wrote:
>> PSC platform profile mode is only supported on Linux for AMD platforms.
>>
>> Some older Intel platforms (e.g T490) are advertising it's capability
>> as Windows uses it - but on Linux we should only be using MMC profile
>> for Intel systems.
>>
>> Add a check to prevent it being enabled incorrectly.
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>> ---
>>  drivers/platform/x86/thinkpad_acpi.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index e6cb4a14cdd4..be194be43663 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -10548,6 +10548,11 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>>  				dytc_mmc_get_available = true;
>>  		}
>>  	} else if (output & BIT(DYTC_FC_PSC)) { /* PSC MODE */
> 
> After your recent patch series this now reads:
> 
>         } else if (dytc_capabilities & BIT(DYTC_FC_PSC)) { /* PSC MODE */
> 
> Please rebase on pdx86/for-next and send a new version.
Ack - will do.

> 
> 
> 
>> +		/* Support for this only works on AMD platforms */
>> +		if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD) {
>> +			dbg_printk(TPACPI_DBG_INIT, "PSC not support on Intel platforms\n");
>> +			return -ENODEV;
>> +		}
> 
> So I assume that e.g. the T490 does advertise MMC capability so
> this path is not actually hit there ?
No - they don't have MMC so this path is hit.

> 
> IOW this is just a sanity check. Or is this path being hit on actual
> hw? The reason I'm asking is because if the path is being hit on actual
> hw then the patch should go to my fixes branch too.
> 
This is being hit on a few of the Intel platforms of that generation. It
seems they don't have MMC mode support, but do have PSC mode - but that
only works on Windows for Intel (needs driver changes we don't have).

Thanks
Mark
