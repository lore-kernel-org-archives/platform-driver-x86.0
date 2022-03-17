Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1C4C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Mar 2022 17:13:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236744AbiCQRPG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Mar 2022 13:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbiCQRPG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Mar 2022 13:15:06 -0400
Received: from mail1.bemta35.messagelabs.com (mail1.bemta35.messagelabs.com [67.219.250.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A846E0998
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Mar 2022 10:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1647537228; i=@lenovo.com;
        bh=1EK8ySnmNDcXiFv+WApi7Ks4I76Rxbk3GAa+hIm7940=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=e6rt2kWWAsk/VwdiOYMAaQnHOD7DX8DAiTn5Y8rOgBXVn7b9XX9csbYmL00RzUNyp
         yY+xoGBU7flOXw9rPuTmYPK+dNEJRC8yxgoJSdU+EUmr68Qv8I/9ZT7lOhbufwsDv2
         1y+GQSK5rINT8cYfFS8ax/EB5l9gwbcU7Qp7GThPGPoGH0wN0ldN8y45oQxa7Rb/et
         lIDL+NLb9yptYiRydEBJ9mTx2SqVMyDXAFXpfuKM26CM5ZTcbxK1qV9VCCeua2nzoY
         LH9YCjLIWlDR1j09uVKIRSYUlQ2RRROAzIx7qVvbWvHguZr3mGAqOJpt6utj/J4BLy
         coBlJkQ/HKhag==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDJsWRWlGSWpSXmKPExsWSoS+lr+uTY5x
  k0Dedw+LN8elMFgemTmO2WL3nBbMDs8emVZ1sHu/3XWXz+LxJLoA5ijUzLym/IoE14/DObqaC
  Q9YV9y/9Z2xg/G3QxcjFwSiwlFmipaOJHcJZxCpxYkIfG4TTySSxqHsmmCMkMIdJYt3fFewQz
  kEmiQ0915i7GDk5JASOM0p0r3KHSHQySuze+gOqZQKTxLcTu5khnCeMEo1tP6H67zFKzGu+xQ
  TSzytgK3H7RScbiM0ioCpxdm8LI0RcUOLkzCcsILaoQLjE/WefwWqEBdIlTj89BxZnFhCXuPV
  kPtgcEQF1iakdPUA1HEBxR4mGg3wQu7YzShyd85UVpIZNQFtiy5ZfYHM4BewkNk07zQgxR1Oi
  dftvdghbXmL72zlgvwkJKEv86j8P9aecxIq916HsBInmKUcZIWxJiWs3L7BD2LISR8/OYYGwf
  SWWz+6CqteVuLDyGJSdI/Fsy2e4mad6zzFNYNSdheTlWUhem4XkvFlIzlvAyLKK0SqpKDM9oy
  Q3MTNH19DAQNfQ0ETX0kzXxEAvsUo3Ua+0WLc8tbhE10gvsbxYL7W4WK+4Mjc5J0UvL7VkEyM
  wIaUUJWjsYOzp/6l3iFGSg0lJlPeounGSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne9dlAOcGi
  1PTUirTMHGByhElLcPAoifCG6wCleYsLEnOLM9MhUqcYdTmubNu7l1mIJS8/L1VKnFcgEahIA
  KQoozQPbgQsUV9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxbDXIJT2ZeCdymV0BHMAEd0S
  hgBHJESSJCSqqBaaHFsg1e+xxv3zy1xCdSQngTE4NQscXTq35HrY2XbaoqL+f0/rjYiEuAOdu
  06Ev9ia9yi/f2xlw1Ur0UMk3knOyp3SqJXMc+3WKoWuyoNVOrq23zAdtLZubpTMGf4h+WGgWs
  LN4Xv37r/rmsS26cu1O9PSbG4sJmdfNA3luvl5XfjnP5bfOqLkMi1+2t3WpPlfyI9kqxvOwVl
  yM33t/fV/4oU8G4SnL6ag4xtcdrHwsmLr83OZb784PVPGnvBVds5Ty6vPPKkcVflu8xPc7i2Z
  J/7+Q2+68HqlM2cG7vNTl8UpA16gvbm1dXe74u87V8uE771PPKwFee+fbckxtT3ro7bxMs5A2
  fupTp+peCS0osxRmJhlrMRcWJALYwghZPBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-22.tower-655.messagelabs.com!1647537227!1723!1
X-Originating-IP: [104.47.26.47]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23128 invoked from network); 17 Mar 2022 17:13:47 -0000
Received: from mail-psaapc01lp2047.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.47)
  by server-22.tower-655.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Mar 2022 17:13:47 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIKvkCXxNRrT/Cn7LLZhbAspQvnt0ZJrcq+ia//SBv0xA8S9GYixoviNXy1QM0jzUwLihaT4cGXJ6/Qejp4JLSZ962MwEpzV/szpeAcQvM2j8wgDXlYwzOh2UsFrFofP88hY2ZrD5Hw1fKO7W4S2jnN+0DmBqK6s/5ZOXh6FX7ntwgKrjh3jH3aaDFjeUGUF5JPxGoET8Z/gc1Jak+3cy9idG1is/7ABeG+bsxFZ+QpWOU3G99ReyOvhiacSR2+CLrTO++J1S/9S23jNCGua5XE4ucWBf0C5bmx7mIY5pYW0DkfY4NylKG1zHIsS76Y2woomasVI350myZ+ry16ZZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EK8ySnmNDcXiFv+WApi7Ks4I76Rxbk3GAa+hIm7940=;
 b=Knx1mIVr986YQsAiGAQWMXG0esZ3D8Zu6XdxXNsoICDjv9EPL7poP915hryQ+/pD6VFwSDGNWaBEj6XBXJiW2iH9WRF9dWS5FXajJARu5ziNyeW6xDhgTYJ9T/HZxki6G3pQFsD0M+BRW7+/8jnX6FJOJZPdovX/r/jlFPHq7RMTjjiBSr7AKELqzDw7Ca+tAdqIAMXlgQBVx9jhu00f4/WheIOonusLLmZhXCykHI3XrQO2uOihen0HT9VY2oE0fnbHpmKnArJv1vlQUsXG18m+cMY3jqRbliTS/M1oQAnQSbW9eY8+zeaDbAoLqMoOnX5iuPYsn9yDDoDmF0t/vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SLXP216CA0053.KORP216.PROD.OUTLOOK.COM (2603:1096:100:5::15) by
 TY2PR03MB3822.apcprd03.prod.outlook.com (2603:1096:404:66::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.13; Thu, 17 Mar 2022 17:13:45 +0000
Received: from PSAAPC01FT043.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:5:cafe::bd) by SLXP216CA0053.outlook.office365.com
 (2603:1096:100:5::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21 via Frontend
 Transport; Thu, 17 Mar 2022 17:13:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 PSAAPC01FT043.mail.protection.outlook.com (10.13.38.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 17:13:44 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Thu, 17 Mar
 2022 13:13:42 -0400
Received: from [10.38.63.5] (10.38.63.5) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Thu, 17 Mar
 2022 13:13:42 -0400
Message-ID: <44eee4e4-d7b3-d779-3f2d-29bddfe44e78@lenovo.com>
Date:   Thu, 17 Mar 2022 13:13:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [External] Re: [PATCH v2 2/2] platform/x86: think-lmi:
 Certificate authentication support
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <markgross@kernel.org>, <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20220315195630.3209-1-markpearson@lenovo.com>
 <20220315195630.3209-2-markpearson@lenovo.com>
 <aec4389f-de13-7c8b-3ac9-99796ad1575f@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <aec4389f-de13-7c8b-3ac9-99796ad1575f@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.63.5]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57570709-0b95-4bac-c993-08da08397e3e
X-MS-TrafficTypeDiagnostic: TY2PR03MB3822:EE_
X-Microsoft-Antispam-PRVS: <TY2PR03MB3822D01A35CD7A0F69ACB1B6C5129@TY2PR03MB3822.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v5zr/LDGj3KtOGfQpbfickTe0krqrra0dZ+xmmnvOoH7/NRvXc0VcyTK0E6Xw83LjEkhWC7oyUkDiVK1oS0dsX7jS1iw0N5viAW87KEOkixXq4o0A7hQOj5FiQHYabrSLt9qHyx+VuBzelPj04euD/tANybnU8gFltKv4vm4+TCKdaWwrubwvJM+GEb6Cv1fd24qFTERNeYSu3Z/vA8C4KhISJomeEfc4Gq2IEp9pdBq8J30FjKyk2ItMamXVc5HUrKmLP2pA8RQE5vlTdAsfld6nGtjJWnHA++T6AHmeyYVtZWayFePr/NgZFyCiOqsX1Jkr+aGIGOStfY7CXi7ZqHVEdss09wZ15E0uASyYp+HqsNatz8AP49ir7TZb2ObFjmnKVAkEPdB/CKP6i8AHeEN4QvTlv6Qcy7KsuZPzfjhPSA7EwvWdpOQqSvMioWXMLFiNqlqNZhiwOhKwnw+r2L1XEBGSqJO+8s/93Mwrjc31AUlmZ4oJA4jXiV9oksCiMRT9WgccPAafe+fuj6+OkbXwWi3K2yYseE3STGoRSgTRb9T2iDKLvA5g5aTZ49yfH0OEMEr7VpNlAXTDW6TRzfSmzAoQBvTlxHBgszrk2fMhLyAw4Yj0x5Wi8wdFtO3GG+kNIe7jE+oz5OoYbZr3A/fLM/Fp/TBc2aAHlLA/K0oT4Z0cfhFfHx3pSWFO9ME2nc6fq7hFWn0lrrGPB5CDl0ZdbEVBk5RyTBFNQGitKgUJ/ZGwQ/Ka0noz3l8PtPgTFQ8+Kx2UylL9Ub7nDWw9vwc3FkepoG84D4pWV51U0iGfOG/JCy2EoPWnWKMOCDI
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(8936002)(36906005)(4326008)(5660300002)(31696002)(82960400001)(8676002)(70206006)(70586007)(356005)(86362001)(81166007)(508600001)(40460700003)(82310400004)(316002)(6916009)(54906003)(36756003)(36860700001)(16576012)(53546011)(83380400001)(47076005)(336012)(31686004)(2616005)(26005)(186003)(426003)(16526019)(2906002)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 17:13:44.6174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57570709-0b95-4bac-c993-08da08397e3e
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT043.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR03MB3822
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Hans

On 2022-03-17 07:21, Hans de Goede wrote:
> Hi Mark,
> 
> On 3/15/22 20:56, Mark Pearson wrote:
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
>>  - signature and save_signature attributes needed for setting BIOS
>>    attributes using certificate authentication.
>>
>> Tested on X1 Carbon 10 with special trial BIOS. This feature is not
>> generally available yet but will be released later this year.
>>
>> Note, I also cleaned up the formating of the GUIDs when I was adding
>> the new defines. Hope that's OK to combine in this commit.
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>> ---
>> Changes in v2:
>>  - Combined set_signature with signature and moved save_signature under
>> the authorisation folder
>>  - utility function to strip CR from string
>>  - Clean up code as recommended from review
> 
> Thanks this is looking better now, I still have a few small
> remarks, see below.
> 
>>
>>  drivers/platform/x86/think-lmi.c | 560 +++++++++++++++++++++++++------
>>  drivers/platform/x86/think-lmi.h |   5 +
>>  2 files changed, 461 insertions(+), 104 deletions(-)
>>
>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
>> index 0b73e16cccea..1db34a6c94c2 100644
>> --- a/drivers/platform/x86/think-lmi.c
>> +++ b/drivers/platform/x86/think-lmi.c
>> @@ -16,6 +16,7 @@
<snip>
>> +
>> +	if (setting->cert_installed) {
>> +		/* Certificate is installed so this is an update */
>> +		if (!setting->signature || !setting->signature[0]) {
>> +			kfree(new_cert);
>> +			return -EACCES;
>> +		}
>> +		/* Format: 'Certificate,Signature' */
>> +		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
>> +				new_cert, setting->signature);
> 
> The block starting here.
> 
>> +		if (!auth_str) {
>> +			kfree(new_cert);
>> +			return -ENOMEM;
>> +		}
>> +		ret = tlmi_simple_call(LENOVO_UPDATE_BIOS_CERT_GUID, auth_str);
>> +		kfree(auth_str);
> 
> And ending here, is identical in the if and else paths with the
> exception of the guid.
> 
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
> 
> This comment looks weird with it being placed above the error check + return and
> the code really is self explanatory, please drop it.
> 
>> +	if (ret) {
>> +		kfree(new_cert);
>> +		return ret;
>> +	}
>> +
> 
> Together with the if/else refactoring we then get:
> 
> 	if (setting->cert_installed) {
> 		/* Certificate is installed so this is an update */
> 		if (!setting->signature || !setting->signature[0]) {
> 			kfree(new_cert);
> 			return -EACCES;
> 		}
> 		guid = LENOVO_UPDATE_BIOS_CERT_GUID;
> 		/* Format: 'Certificate,Signature' */
> 		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
> 				new_cert, setting->signature);
> 	} else {
> 		/* This is a fresh install */
> 		if (!setting->valid || !setting->password[0]) {
> 			kfree(new_cert);
> 			return -EACCES;
> 		}
> 		guid = LENOVO_SET_BIOS_CERT_GUID;
> 		/* Format: 'Certificate,Admin-password' */
> 		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
> 				new_cert, setting->password);
> 	}
> 	if (!auth_str) {
> 		kfree(new_cert);
> 		return -ENOMEM;
> 	}
> 
> 	ret = tlmi_simple_call(LENOVO_UPDATE_BIOS_CERT_GUID, auth_str);
> 	kfree(auth_str);
> 	if (ret) {
> 		kfree(new_cert);
> 		return ret;
> 	}
> 
Agreed - much nicer. I'll get that implemented

>> +	kfree(setting->certificate);
>> +	setting->certificate = new_cert;
>> +	return count;
>> +}
>> +
<snip>
>> +
>> +static ssize_t signature_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +			 char *buf)
>> +{
>> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>> +
>> +	if (!setting->signature)
>> +		return sysfs_emit(buf, "Not set\n");
>> +
>> +	return sysfs_emit(buf, "%s\n", setting->signature);
>> +}
>> +
>> +static struct kobj_attribute auth_signature = __ATTR_RW(signature);
> 
> So thinking about this more, having a show function at all is a bad
> idea, that will allow an attacker to potentially steal the signature.
> 
> I guess that the signature is specific to the setting being changed, 
> but this will still allow a replay attack, to restore a setting which
> an attacker has seen being changed in the past. E.g. the admin
> enables USB ports for some debugging and then disables them again,
> now an attacker who was able to read the signature file while the
> admin was enableing the USB ports might re-enable them later.
> 
> So it would be best to just make this __ATR_WO and not have
> a show function at all, like we do for the password.
> 
Fair enough. I'm good to remove it.
> 
> 
>> +
>> +static ssize_t save_signature_store(struct kobject *kobj,
>> +				  struct kobj_attribute *attr,
>> +				  const char *buf, size_t count)
>> +{
>> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>> +	char *new_signature;
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
>> +	strip_cr(new_signature);
>> +
>> +	/* Free any previous signature */
>> +	kfree(setting->save_signature);
>> +	setting->save_signature = new_signature;
>> +
>> +	return ret ?: count;
>> +}
>> +
>> +static ssize_t save_signature_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +			 char *buf)
>> +{
>> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>> +
>> +	if (!setting->save_signature)
>> +		return sysfs_emit(buf, "Not set\n");
>> +
>> +	return sysfs_emit(buf, "%s\n", setting->save_signature);
>> +}
>> +
>> +static struct kobj_attribute auth_save_signature = __ATTR_RW(save_signature);
> 
> idem, make this __ATTR_WO too.
ack

> 
<snip>
>> @@ -896,8 +1230,15 @@ static void tlmi_release_attr(void)
>>  	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
>>  	if (tlmi_priv.can_debug_cmd && debug_support)
>>  		sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &debug_cmd.attr);
>> +
>>  	kset_unregister(tlmi_priv.attribute_kset);
>>  
>> +	if (tlmi_priv.certificate_support) {
>> +		kfree(tlmi_priv.pwd_admin->certificate);
>> +		kfree(tlmi_priv.pwd_admin->signature);
>> +		kfree(tlmi_priv.pwd_admin->save_signature);
>> +	}
>> +
> 
> 1. These kfree() calls should be done only after removing the
> sysfs group, otherwise here is a race where the could still
> be accessed after being free-ed
> 
> 2. kfree(NULL) is a no-op so the "if (tlmi_priv.certificate_support)"
> check is not necessary.

Ack - I'll fix these.
Thanks for the review

Mark


