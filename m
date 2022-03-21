Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926E3C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Mar 2022 00:15:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245246AbiCUAQb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 20 Mar 2022 20:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243388AbiCUAQa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 20 Mar 2022 20:16:30 -0400
Received: from mail1.bemta31.messagelabs.com (mail1.bemta31.messagelabs.com [67.219.246.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F68527CFE
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Mar 2022 17:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1647821702; i=@lenovo.com;
        bh=rhIE/Am5ujgArjkjLl5AUWdra58s932jdBO6Nb8oI00=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=qNYo3HRvpEkiWbbwv9v02IkR/47GJAG+DjERyPw2phqhIrQ6VSxcWDHlkW3dvlEtS
         i9CPgBsM6Wvvc3w7e0Xiz42EmBcOfHj9lT/Qv2+DXD49mqiuCAk5+Rvi9oQ0MhtOf1
         62UK46dTMdNVkKKT2z4zIu2PcSpURnJfIfjzB6cBFOa9hP/xDL7M7D+LuarO/2jBlY
         lmOnKyqQjCkIYzLTr+5H3lZ4iHCeeIg42q5ZEe68vrudeCuDcCHcKbej3CEUiFc0mB
         A7yZFBlFGGLYyC32d2t1kxvII22qhqwKCsnpDF1670uOck3Ra4rGlDXd9PfVSEdF7e
         7sxymJalNLxpA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRWlGSWpSXmKPExsWSoS+lpdt22Dz
  JYOYbTos3x6czWRyYOo3ZYvWeF8wOzB6bVnWyebzfd5XN4/MmuQDmKNbMvKT8igTWjNMnD7IU
  /JaoOPD4AlMDY69IFyMXB6PAUmaJO3tusEA4i1gl7u1tZYZwOpkkFnXPZANxhARmM0l8bvrA2
  sXICeQcZJKYfsUKxJYQOM4o0b3KHaKok1Fi99YfUB0TmCTONB6Hcp4wSszc+Amq/RGjxNuHJl
  2MHBy8ArYSned5QMIsAqoSH5ZtYwGxeQUEJU7OfAJmiwqES9x/9pkNxBYWSJfo+ngELM4sIC5
  x68l8JhBbREBdYmpHDxvISGYBR4mGg3wQa7czSnxZ/ACsnk1AW2LLll9gNZwCdhK/bqtDjNGU
  aN3+mx3ClpfY/nYOM8SVyhK/+s8zQzypIDH7TS+UnSDRPOUoI4QtKXHt5gV2CFtW4ujZOSwQt
  q9Ex9InUPW6EmsPrYSqyZG4f+0RG4QtJ3Gq9xzTBEbdWUg+noXks1lIzpuF5LwFjCyrGC2Tij
  LTM0pyEzNzdA0NDHQNDU10DXUtDPUSq3QT9UqLdVMTi0t0gdzyYr3U4mK94src5JwUvbzUkk2
  MwDSUUsQYuINxRs9PvUOMkhxMSqK87cfMkoT4kvJTKjMSizPii0pzUosPMcpwcChJ8F4+YJ4k
  JFiUmp5akZaZA0yJMGkJDh4lEV6XQ0Bp3uKCxNzizHSI1ClGXY4r2/buZRZiycvPS5US5z0CU
  iQAUpRRmgc3ApaeLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5l0PMoUnM68EbtMroCOYgI
  7QZzUDOaIkESEl1cA0QeHwSzPTICmphZFeE99JM1TsXqFw5ww/x83PgmUlLYdFpt8v9PvzyGq
  jwerZQtFdGifn9Br5VWVeYGJo/B/DxKEWrn2akcXi0rPTH3KdJY5o+kz46pX7qvLlyWN+Bw5E
  GNZt3CJ8Ie2r+4vFu14vnl9yapnGNZfq97xJ3K+W6vzjmt10355z0aPEi39mMTt9VQx4/cX34
  3q5mpbezFlVlysOuXMLHFrRnDipoj08NfxgdXHELOfH9tKrf6cwH06eGneV0f0RJ0+7a0VKBO
  f/hHs6lZZPOLlYpWc2ZT78VtL2e4vBmU4hjbTtK5wn9z8TmrV9keoeM7VAlh23fp2+uopHp+6
  i2rb+8rf8h3mVWIozEg21mIuKEwG65br/SgQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-13.tower-686.messagelabs.com!1647821700!13698!1
X-Originating-IP: [104.47.26.42]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18685 invoked from network); 21 Mar 2022 00:15:01 -0000
Received: from mail-psaapc01lp2042.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.42)
  by server-13.tower-686.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Mar 2022 00:15:01 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LX2u0k2WWzHljRhNkmtQQWepRMmNrmMJoOfeV4KXcrK6PJyfA5Zt75vrNO1+GVD/LnXbnUI90OCiqZHGe5xucFL68Z3rfLTsf9hnpIMG5L8d6C8vqbCv8VsKOqVZF/fWxX23ZbaWcD8L/kzth9kYBkRLrXdgj+aAnivkbjZulStseIxvaNWCAmxgzNHEQy/YCA6/Bwu96PGQj6l+rXypef48BgV01TDEJqvnHKQW/isRpW5HdxHvD2+GeCNeDTeYP9ockgw4SMkylkVn178qdpHzox/8wKERgD1ygXkt5QTCF9kP0z16Nctjkx5nLRtKMmLY0SnNJZguYs2J3OZ4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhIE/Am5ujgArjkjLl5AUWdra58s932jdBO6Nb8oI00=;
 b=fIk/cxJfjdeZr83+o3Nd6Kf1I+ZromrrLfY8lMa3P0QC/2UjCqnD+N7Mg4Drvkp4ONC8V6hytG1ANlQY7IPXVMpQUcp1HoWWQzDi4xsZScQFObKnTHzOnZ6c2q7JNKfK9xaCirAyPy4lzViWQdGU3VeCTmBV2V/vht/uv+3+KxYDoqPuIDYVtQDuCA4gwLROvMVXR9SFo0lyuia46u5r4KPqJzHgiDQdrp5p96jz3k3+jvpv/SpyUC7JbPxbxOAd5h51RLpRQi2eB0qyKLEaRAcEU2STyHL40bon+5j1zPLVQyOJ13b6g2Jna7QgA4nRonA4by+r6vQQrv58HsN2oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SLXP216CA0025.KORP216.PROD.OUTLOOK.COM (2603:1096:100:4::11) by
 TYZPR03MB5790.apcprd03.prod.outlook.com (2603:1096:400:75::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.7; Mon, 21 Mar 2022 00:14:52 +0000
Received: from PSAAPC01FT055.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:4:cafe::ae) by SLXP216CA0025.outlook.office365.com
 (2603:1096:100:4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17 via Frontend
 Transport; Mon, 21 Mar 2022 00:14:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 PSAAPC01FT055.mail.protection.outlook.com (10.13.38.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Mon, 21 Mar 2022 00:14:51 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Sun, 20 Mar
 2022 20:14:50 -0400
Received: from [10.38.62.172] (10.38.62.172) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Sun, 20 Mar
 2022 20:14:49 -0400
Message-ID: <4a7138ee-0bca-2a9d-5589-6aa278cbf0f3@lenovo.com>
Date:   Sun, 20 Mar 2022 20:14:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [External] Re: [PATCH v3 2/2] platform/x86: think-lmi:
 Certificate authentication support
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <markgross@kernel.org>, <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20220317214008.3459-1-markpearson@lenovo.com>
 <20220317214008.3459-2-markpearson@lenovo.com>
 <cb22c2f8-e289-a7a2-f51d-f4d0056814e2@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <cb22c2f8-e289-a7a2-f51d-f4d0056814e2@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.62.172]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53846787-63c5-4598-9764-08da0acfd1ea
X-MS-TrafficTypeDiagnostic: TYZPR03MB5790:EE_
X-Microsoft-Antispam-PRVS: <TYZPR03MB5790B4C17ACBEA1C41120835C5169@TYZPR03MB5790.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tf8qjH7mx1BUVf44RN8cXE4vbQlKr0QQAlC2Ckk+/j6AyyLjRGcqIWqilKPZoqaQl2RPm7O9I1szHmQe6aTqDq7PmUIgdPApSKMyBjreKDjNENvaZgGBjKBW+zHrpRAPQsS+oxOe/pSgW4FD05z7rrXcZd7tvVvEL4m/Fxz8Eljq+hUEYsimt3e9o6jha7Tq6niMZk3a8d61OjvzUcoiaW1GnIZgU1VpH5ZqcrB1LIP74wzqiR6NZrtQjD2ElERXLtH8gPenRUw6MP5Md6Iizq2V43U6Xb0lHo1ZeW+ZZbl2BfF04I8/60GAVQmV2QDDEPjd6fBO0DHkSZhb7q9/7UszVezAk8UYr/2jArd2feaSuQOF/3E0XOwAHp1A3ZLPHTx634TCheelLpg+HzjKERdPoZkwNnEQQJd6qDNL6nYEiUYfTj8jyQ1rTs8SUcCsHHZUgU7C+1YyXWAy06ATZRI46VYcpRulxF+dtL0Dv/XSQp9EPr4KrEHrOCiTd/4anNiem1SQFGca250ivn6Y+4wYU6TJ0xvm6Ujs8EgXY2uxPxFvfHn2vxAb8NkGOjzPV3eFpxsPvlKjKIZfgpFTmnRFJXUD6dA8rHzaaaBndznT+jETHqWVYAyKHAcz7qDtxyNcvG4phVuqfyb8VaWuV5KEeUUAYctEh9LuJM64BrfAYjRjFuQZsTE/TgdeEWo8CFyeNfvB1UxVoLKv5SvQr2xFTjLDyhJb9vYHHF8tjcGmvQr4nOXHivVq78/4c9blbt8hQHe6B6FrVg0T/mbm3A==
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36756003)(31686004)(508600001)(53546011)(36860700001)(40460700003)(2616005)(5660300002)(8936002)(2906002)(82960400001)(47076005)(4326008)(8676002)(356005)(81166007)(70206006)(70586007)(16576012)(316002)(36906005)(336012)(83380400001)(82310400004)(31696002)(426003)(16526019)(186003)(26005)(86362001)(6916009)(54906003)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 00:14:51.8292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53846787-63c5-4598-9764-08da0acfd1ea
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5790
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Hans

On 2022-03-18 07:37, Hans de Goede wrote:
> Hi,
> 
> On 3/17/22 22:40, Mark Pearson wrote:
<anip>
>> +	pr_info("Simple_call %s : %s\n", guid, auth_str);
> 
> This appears to be a left-over debug pr_info, I've dropped
> this while merging this.
> 
Ouch - my bad. Thanks for catching that.

<snip>
>> +
>> +static ssize_t signature_store(struct kobject *kobj,
>> +				  struct kobj_attribute *attr,
>> +				  const char *buf, size_t count)
>> +{
>> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>> +	char *new_signature;
>> +	int ret;
> 
> ret is never set in this function, but ...
> 
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
>> +	kfree(setting->signature);
>> +	setting->signature = new_signature;
>> +
>> +	return ret ?: count;
> 
> It is checked here and for some reason the compiler does
> not warn about this.
> 
> I've changed the return to just:
> 
> 	return count;
> 
> And dropped the ret declaration while merging this.
> 
Ack and thanks.
> 
>> +}
>> +
>> +static struct kobj_attribute auth_signature = __ATTR_WO(signature);
>> +
>> +static ssize_t save_signature_store(struct kobject *kobj,
>> +				  struct kobj_attribute *attr,
>> +				  const char *buf, size_t count)
>> +{
>> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>> +	char *new_signature;
>> +	int ret;
> 
> Idem.
> 
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
> 
> Idem.
> 
> 
> With these small changes I've added this to my review-hans
> branch now. I hope the kernel-build-robot will give it
> a pass there soon and then I'll push it to my for-next branch.
> 
> Note while merging this I did notice one thing which
> I would like you to address in a follow-up patch
> (based on the version currently in review-hans).
> 
> tlmi_priv.pwd_admin->certificate gets set but is never used,
> please drop the certificate member from struct tlmi_pwd_setting
> and also all the code setting it.
> 
> This will also allow you to move the kfree(new_cert)
> up a bit inside certificate_store() to directly
> after the if (setting->cert_installed) ... else ...
> like this:
> 
> 	if (setting->cert_installed) {
> 		...
> 		auth_str = kasprintf(...)
> 	} else {
> 		...
> 		auth_str = kasprintf(...)
> 	}
> 	kfree(new_cert);
> 
> Avoiding the need to have a kfree(new_cert) in
> all the error-returns below this block.
> 
> And the end of this function can then be
> simplified to just:
> 
> 	return ret ?: count;
> 
Agreed - I'll update this.

Mark

