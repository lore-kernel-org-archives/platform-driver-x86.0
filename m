Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE7AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Mar 2022 15:46:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbiCNPrV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Mar 2022 11:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242698AbiCNPrU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Mar 2022 11:47:20 -0400
Received: from mail1.bemta35.messagelabs.com (mail1.bemta35.messagelabs.com [67.219.250.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5C23DA4D
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 08:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1647272769; i=@lenovo.com;
        bh=OCnUlxGxnddj0sc9C2FFBHXtIo93tZgLj9TQcmR8XDk=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=OG6/LUhs5qMdDr2bS/1vU8569tlw7lPAm997Uc7LlaFzlCF68b4bcxJdgQ6ZEYFCN
         hNRkfVwwMn7YPUML7O8Yrx+bX0dV838kJTQVxYsCsDhk85MhGPvhJEMqKk2ltNvvRN
         agKJQeVs1yMQt34qFklj7kdB7Wk3D2seDOs0/jI7rxNZ5kDb32wi8pTacbPVdLENS9
         Jg/z9gqNRxSw5ugeQOg5zVK5YiAfVVmbIOgxSCH51TccVPtM4m1Ro95jPquw7V/Z4L
         NghHeWXBOkyA17QCZtKZ7JRPp3XKketiS+uKK9RtwSZQ0aUDU/wxNmQYpwCHVsZB/c
         d0cST/vk2DSiw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAJsWRWlGSWpSXmKPExsWSoS+lp+uYrJ9
  kMP0Qu8Wb49OZLA5MncZssXrPC2YHZo9NqzrZPN7vu8rm8XmTXABzFGtmXlJ+RQJrxuxLa9kL
  ZntVfPn3l7mBscm2i5GLg1FgKbPErBOzWLsYOYGcRawSu6dFQCQ6mSQmz7vHDuIICcxjkrh8+
  zMbhLOXSWLG2rcsII6EwHFGie5D65ggMp2MEj9enWKBcCYxSfRcb4Ya8IRR4tb+aYxwzsH5xx
  lBdvIK2Eq8nr6ECcRmEVCVuPK4hQkiLihxcuYTFhBbVCBc4v4zkO2cHMICKRIrZ/9iB7GZBcQ
  lbj2ZD1YvIqAuMbWjB6iGAyjuKNFwkA9i13ZGifY3S8DmsAloS2zZ8gtsDqeAncT/x4eYIOZo
  SrRu/w01U15i+9s5zCC2kICyxK/+82C2hICixIrXW9gg7ASJ5ilHGSFsSYlrNy+wQ9iyEkfPz
  mGBsH0lzk14zQph60p8amtmgrBzJP5MnQI1U07iVO85pgmMurOQvDwLyWuzkJw3C8l5CxhZVj
  HaJBVlpmeU5CZm5ugaGhjoGhqagGkjYwu9xCrdRL3SYt3y1OISXSO9xPJivdTiYr3iytzknBS
  9vNSSTYzApJRSlPJuB+Pfvp96hxglOZiURHlfJegnCfEl5adUZiQWZ8QXleakFh9ilOHgUJLg
  5Y8HygkWpaanVqRl5gATJExagoNHSYTXPgYozVtckJhbnJkOkTrFaM9xZdvevcwcD06cBJJ/P
  /0FktfWL9jHLMSSl5+XKiXOK5IE1CYA0pZRmgc3FJbQLzHKSgnzMjIwMAjxFKQW5WaWoMq/Yh
  TnYFQS5r2VCDSFJzOvBG73K6CzmIDOmietB3JWSSJCSqqBKWb/YsHj8g1Rn9rEhP7fs8nL6b3
  muHpaZQ7DYsu7xt3/FBtM46cbfNZUqv/ybs6ELRdSztmU3Uy09BF6ZMlrGsdzIrJAoq5rTTbX
  nRNV1755171WTAyVLjnOpyTWLv86gclQ55dLa2KVwkljhRkG3vqsCw2zeBIMX3E0pgl0fpONk
  U8+YcId76OXHSfCpGH7VCbl4YEXTx6+CxWasta8cH1Tfkv1igtGexY/mBlmtVTK4k9pdG8G77
  8zj2+Vn5n7c+VV3j/sp6NSNJlLTv31iuucZcVX8mW2MvebkvAfkgvZ2W/6s3vtvCa+wCiybor
  3pH7WLcePvNx4vPr9XP+s3Gunza6fMj2m1hshOUOJpTgj0VCLuag4EQD1uGQdYwQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-7.tower-636.messagelabs.com!1647272767!28015!1
X-Originating-IP: [104.47.26.46]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9226 invoked from network); 14 Mar 2022 15:46:08 -0000
Received: from mail-psaapc01lp2046.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.46)
  by server-7.tower-636.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Mar 2022 15:46:08 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gk2wDm0e510vV1sBkqB1MqujUDT/qZrf3qsCKXAzOjM0LkZCxZ/4m5QWD03wQJ1Ced1axowI6TWPTobNVVF+OYjsm1CvrBpav9DkQLUuzzJ8/W55RbshiPFBBOmJpZXfzf4lhT1gviyi0q1KU9sMWDPGN5i0edtQigyNueXDzlXFiGM2gbbCea3qMYk9RXH3YIvcJuJfcEXVhlFM98NcwyN+kUln7iaW0tsIi1V13TMREAfpTIW+SDfWDGgv/qeji7ekWlEbMaC7PtQI72pvJ9zuPfnNCdD9914X6T+KJu7SYu14cQ8/dRNSfk8C4Ue0rPGAQVDo7h+UIzqp/8komg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCnUlxGxnddj0sc9C2FFBHXtIo93tZgLj9TQcmR8XDk=;
 b=EZgJZxKLVWodG6fk2n7v/VPQG4sqi2A5ofXrXHBmj1DFTcKNBzTl3WzFHrphG0oCw++CTPXRdpHmWf1v4upvT857ckAlgACtnF/GfBBEGcGCsj5DLduMzn7+5CxWKi9ovWyYQ1cJf7wHz0FZ/yBf9ssC7hQRF/DFIYpJsq6vdhJ+JITrzXK1jX4VM8zayaP3Xy9rjlzCL4K2mcYcOzynnhQSvChJKhd0lbJl/GcqBaRdecenJ1tTWKLUTS+aY7Bj4hRbetbDb6BCly6Th/9LlI0MvVagMkvfxxgK9n4QN8+Fok724adPfqVQTi6RN+CzzgzAZPcrQD4XfgP6SPq/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SG2PR0302CA0013.apcprd03.prod.outlook.com (2603:1096:3:2::23)
 by HK0PR03MB4980.apcprd03.prod.outlook.com (2603:1096:203:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.13; Mon, 14 Mar
 2022 15:46:06 +0000
Received: from HK2APC01FT048.eop-APC01.prod.protection.outlook.com
 (2603:1096:3:2:cafe::5) by SG2PR0302CA0013.outlook.office365.com
 (2603:1096:3:2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.7 via Frontend
 Transport; Mon, 14 Mar 2022 15:46:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 HK2APC01FT048.mail.protection.outlook.com (10.152.249.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Mon, 14 Mar 2022 15:46:04 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Mon, 14 Mar
 2022 11:46:04 -0400
Received: from [10.38.111.194] (10.38.111.194) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Mon, 14 Mar
 2022 11:46:03 -0400
Message-ID: <615cf1a0-e62f-2758-e4a4-f2ee7bae2886@lenovo.com>
Date:   Mon, 14 Mar 2022 11:46:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [External] Re: [PATCH 2/2] platform/x86: think-lmi: Certificate
 authentication support
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <markgross@kernel.org>, <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20220312000439.4143-1-markpearson@lenovo.com>
 <20220312000439.4143-2-markpearson@lenovo.com>
 <7f8a13f6-8615-b952-5523-e13bbc4b98be@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <7f8a13f6-8615-b952-5523-e13bbc4b98be@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.111.194]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f67516c6-09ab-464b-2a54-08da05d1bfff
X-MS-TrafficTypeDiagnostic: HK0PR03MB4980:EE_
X-Microsoft-Antispam-PRVS: <HK0PR03MB4980843A4D7B5B6670897BABC50F9@HK0PR03MB4980.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SUEBW3TqMMQD5EKOHkY6EH9fsjqU9sbZPoHSG7PJ77PxVSj3oEey261pT5IN4r+ybYP9vbvH/Je9ri4ZppuaX/g4buTG4hIDOMLuoS+rxLXcUAWbw44IqGBIrYugjJ0xDdWnribmFt7bTew6xy6TudyFanqmLk5eevAyty1vFpnJxdBzy/o0J/xBWvp0uj56cJ52LUdyO71TLQUMnCFJK3sgBs5hjs0lsXGCVvO3twHnN0MgPc47b3e4x7L1Hq8cpn7XtuT/xPrq91gv+wyxzc4mhDTZCd+J8X0jrv3os1wS9bse+09gGlGRpltR4i8yH8usrNwchV71wrU7oQCgRjGeHPCMgvwt2ndnVtGMoekmUJ/LRzF8SwoNuUgZbOxYWIwH9JOH/KDswsTvY4xqJ82xNeu7FI2k1nFhM4rRb1VXxi16p0CoJvW42qSfN3IEY3LvThmLclm+MbSlzfmQPPnvwrK6kVmhl+bEZGdT+NpML9JcCeYs0jpX90E0LzX3F0S+gFTzFDCyXiEZQfQJFCQet1d9Bk6osflXHuE//S//5IfOyVgDM05D+7bu3UdJJk07UpKdz5aSRNB0MwFpsQ0T4Jn/Vau9GcXqdo3UMKUuGV7pikTpOtBL/LzMy30bFD2DVXEDEkP2ugsIxbAsNy5hyZIAwKq7+TEOLS2LK/Dcd2sDIZJW/gGs5x4qYc4mY/dcWoZvVHUJOiTHuEnRoxlOWF5r91HFi5jhgMAmocOp9ISpEXJQ1vtOyCTUDySNWg+foAdAWPshsl3dA3L9Dg==
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2906002)(31686004)(82960400001)(36756003)(4326008)(40460700003)(53546011)(8676002)(81166007)(5660300002)(2616005)(70206006)(70586007)(8936002)(356005)(86362001)(16526019)(426003)(336012)(36860700001)(186003)(26005)(316002)(83380400001)(16576012)(36906005)(54906003)(6916009)(82310400004)(508600001)(47076005)(31696002)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 15:46:04.8508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f67516c6-09ab-464b-2a54-08da05d1bfff
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT048.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB4980
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks for the review Hans

On 2022-03-14 11:15, Hans de Goede wrote:
> Hi,
> 
> On 3/12/22 01:04, Mark Pearson wrote:
>> Implementation of certificate authentication feature for Lenovo
>> platforms. This allows for signed updates of BIOS settings.
>>
>> Functionality supported:
>>  - Cert support available check. At initialisation check if BIOS
>>    supports certification authentication and if a certificate is
>>    installed. Enable the sysfs nodes appropriately
>>  - certificate and signature authentication attributes to enable
>>    a user to install, update and delete a certificate using signed
>>    signatures
>>  - certificate_thumbprint to confirm installed certificate details
>>  - support to go from certificate to password based authentication
>>  - set_signature and save_signature attributes needed for setting
>>    BIOS attributes using certificate authentication
>>
>> Tested on X1 Carbon 10 with special trial BIOS. This feature is not
>> generally available yet but will be released later this year.
>>
>> Note, I also cleaned up the formating of the GUIDs when I was adding
>> the new defines. Hope that's OK to combine in this commit.
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>> ---
>>  drivers/platform/x86/think-lmi.c | 560 ++++++++++++++++++++++++++-----
>>  drivers/platform/x86/think-lmi.h |   7 +
>>  2 files changed, 475 insertions(+), 92 deletions(-)
>>
>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
>> index 0b73e16cccea..54ce71f97c37 100644
>> --- a/drivers/platform/x86/think-lmi.c
>> +++ b/drivers/platform/x86/think-lmi.c
>> @@ -16,6 +16,7 @@

<snip>
>>  
>> +static ssize_t cert_thumbprint(char *buf, const char *arg, int count)
>> +{
>> +	const struct acpi_buffer input = { strlen(arg), (char *)arg };
>> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>> +	const union acpi_object *obj;
>> +	acpi_status status;
>> +
>> +	output.length = ACPI_ALLOCATE_BUFFER;
>> +	output.pointer = NULL;
> 
> This initialization of output is redundant, it is already initialized
> when it is declared.
Ack

<snip>
>> +
>> +static ssize_t certificate_store(struct kobject *kobj,
>> +				  struct kobj_attribute *attr,
>> +				  const char *buf, size_t count)
>> +{
>> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>> +	char *auth_str, *new_cert, *p;
>> +	int ret;
>> +
>> +	if (!capable(CAP_SYS_ADMIN))
>> +		return -EPERM;
>> +
>> +	if (!tlmi_priv.certificate_support)
>> +		return -EOPNOTSUPP;
>> +
>> +	new_cert = kstrdup(buf, GFP_KERNEL);
>> +	if (!new_cert)
>> +		return -ENOMEM;
>> +	/* Strip out CR if one is present */
>> +	p = strchrnul(new_cert, '\n');
>> +	*p = '\0';
>> +
>> +	/* If empty then clear installed certificate */
>> +	if (new_cert[0] == '\0') { /* Clear installed certificate */
> 
> You don't need new_cert anymore here, so do:
> 
> 		kfree(new_cert);
> 
> here.
> 
>> +		/* Check that signature is set */
>> +		if (!setting->signature || !setting->signature[0]) {
>> +			kfree(new_cert);
> 
> and drop it here,
> 
>> +			return -EACCES;
>> +		}
>> +		/* Format: 'serial#, signature' */
>> +		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
>> +				dmi_get_system_info(DMI_PRODUCT_SERIAL),
>> +				setting->signature);
>> +		if (!auth_str) {
>> +			kfree(new_cert);
> 
> and here.
> 
>> +			return -ENOMEM;
>> +		}
>> +		ret = tlmi_simple_call(LENOVO_CLEAR_BIOS_CERT_GUID, auth_str);
>> +		kfree(auth_str);
> 
> Because you were missing a kfree(new_cert) here. Also you should free + clear
> setting->certificate here. So this if block should end up like this:
> 
> 	/* If empty then clear installed certificate */
> 	if (new_cert[0] == '\0') { /* Clear installed certificate */
> 		kfree(new_cert);
> 
> 		/* Check that signature is set */
> 		if (!setting->signature || !setting->signature[0])
> 			return -EACCES;
> 
> 		/* Format: 'serial#, signature' */
> 		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
> 				dmi_get_system_info(DMI_PRODUCT_SERIAL),
> 				setting->signature);
> 		if (!auth_str)
> 			return -ENOMEM;
> 
> 		ret = tlmi_simple_call(LENOVO_CLEAR_BIOS_CERT_GUID, auth_str);
> 		kfree(auth_str);
> 		if (ret)
> 			return ret;
> 
> 		kfree(setting->certificate);
> 		setting->certificate = NULL;
> 		return count;
> 	}
> 
> 
Agreed - that all makes sense. Will update.

>> +	}
>> +
>> +	if (setting->cert_installed) {
>> +		/* Certificate is installed so this is an update */
>> +		if (!setting->signature || !setting->signature[0]) {
>> +			kfree(new_cert);
>> +			return -EACCES;
>> +		}
>> +		/* Format: 'Certificate,Signature' */
>> +		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
>> +				new_cert, setting->signature);> +		if (!auth_str) {
>> +			kfree(new_cert);
>> +			return -ENOMEM;
>> +		}
>> +		ret = tlmi_simple_call(LENOVO_UPDATE_BIOS_CERT_GUID, auth_str);
>> +		kfree(auth_str);
>> +	} else {
>> +		/* This is a fresh install */
>> +		if (!setting->valid || !setting->password[0]) {
>> +			kfree(new_cert);
>> +			return -EACCES;
>> +		}
>> +		/* Format: 'Certificate,Admin-password' */
>> +		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
>> +				new_cert, setting->password);
>> +		if (!auth_str) {
>> +			kfree(new_cert);
>> +			return -ENOMEM;
>> +		}
>> +		ret = tlmi_simple_call(LENOVO_SET_BIOS_CERT_GUID, auth_str);
>> +		kfree(auth_str);
>> +	}
>> +
>> +	/* If successful update stored certificate */
>> +	if (!ret) {
>> +		kfree(setting->certificate);
>> +		setting->certificate = new_cert;
>> +	} else
>> +		kfree(new_cert);
>> +
>> +	return ret ?: count;
> 
> You have 2 "if (ret)" statements here (1 hidden in the return), please change this to:
> 
> 	if (ret) {
> 		kfree(new_cert);
> 		return ret;
> 	}
> 
> 	kfree(setting->certificate);
> 	setting->certificate = new_cert;
> 	return count;
> 
Will do

> 
>> +}
>> +
>> +static ssize_t certificate_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +			 char *buf)
>> +{
>> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>> +
> 
> setting->certificate may be NULL here, you need to check for that and in
> that case only emit a "\n" I guess.
Ack.

> 
>> +	return sysfs_emit(buf, "%s\n", setting->certificate);
>> +}
>> +
>> +static struct kobj_attribute auth_certificate = __ATTR_RW(certificate);
>> +
>> +static ssize_t signature_store(struct kobject *kobj,
>> +				  struct kobj_attribute *attr,
>> +				  const char *buf, size_t count)
>> +{
>> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>> +	char *new_signature, *p;
>> +	int ret;
>> +
>> +	if (!capable(CAP_SYS_ADMIN))
>> +		return -EPERM;
>> +
>> +	if (!tlmi_priv.certificate_support)
>> +		return -EOPNOTSUPP;
>> +
>> +	new_signature = kstrdup(buf, GFP_KERNEL);
>> +	if (!new_signature)
>> +		return -ENOMEM;
>> +
>> +	/* Strip out CR if one is present */
>> +	p = strchrnul(new_signature, '\n');
>> +	*p = '\0';
> 
> Idea for a follow-up clean-up patch: this pattern of kstrdup user-argument
> (buf) + strip '\n' is repeated all over the driver, maybe add a little helper
> for this?
> 
Yes - that would make sense. Will do.

>> +
>> +	/* Free any previous signature */
>> +	kfree(setting->signature);
>> +	setting->signature = new_signature;
>> +
>> +	return ret ?: count;
>> +}
>> +
>> +static ssize_t signature_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +			 char *buf)
>> +{
>> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>> +
> 
> setting->signature can be NULL here.

Ack

<snip>

>> +
>> +static ssize_t set_signature_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +			 char *buf)
>> +{
>> +	return sysfs_emit(buf, "%s\n", tlmi_priv.set_signature);
>> +}
>> +
>> +static ssize_t save_signature_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +			 char *buf)
>> +{
>> +	return sysfs_emit(buf, "%s\n", tlmi_priv.save_signature);
>> +}
>> +
>> +static struct kobj_attribute attr_set_signature = __ATTR_RW(set_signature);
>> +static struct kobj_attribute attr_save_signature = __ATTR_RW(save_signature);
> 
> <note I missed this while reviewing the documentation patch...>
> 
> Why not just use the /sys/class/firmware-attributes/thinklmi/authentication/Admin/signature
> value here ?
> 
> /sys/class/firmware-attributes/thinklmi/authentication/Admin/current_password is
> what is used for password based setting of fw-attributes as well as for changing
> the password; and
> 
> /sys/class/firmware-attributes/thinklmi/authentication/Admin/signature is set
> for changing the certificate, so it would be much more consitent to also use
> that for setting attributes when using certificate based auth?
> 
> Can / will the set and save signature ever be different from one another ? If yes
> then I guess we may need 2 attributes for this, I guess maybe just signature +
> save_signature ? Either way IMHO these 2 attributes / the 1 extra attribute
> for a separate save-signature really belongs under
> /sys/class/firmware-attributes/thinklmi/authentication/Admin/ IMHO and
> not under /sys/class/firmware-attributes/thinklmi/attributes/
> 
> What do you think about moving these there ?
> 
I have no issues with moving them. I had originally intended to have
them in auth but as I needed two signatures (the set and save are
different) I decided to make it explicit and to keep them in the same
place as the attribute being modified. But I can see it making sense to
just keep those under Authentication instead.

I'll update and get rid of set_signature and move save_signature.

Many thanks for the review

Mark
