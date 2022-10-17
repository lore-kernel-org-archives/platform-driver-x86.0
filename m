Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74211C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Oct 2022 20:06:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiJQUGM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Oct 2022 16:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbiJQUGK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Oct 2022 16:06:10 -0400
Received: from mail1.bemta35.messagelabs.com (mail1.bemta35.messagelabs.com [67.219.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB637859D
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Oct 2022 13:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1666037163; i=@lenovo.com;
        bh=sx8U8WSdREnJO1syRwViBC7gI+lvKbTrn8fC9y8Hlmw=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=3rLZjzUALQaywbBrpdiFc4Ti8Tf0F/lJcetALkvrVNL3hZRk2cFYzI1GWBd0GO4jk
         G+0EbYHy2vfkRzK+Db82TvLLammddQ3S9Rs0Orf9BmXHo6zyIMbkVKeHQp7uVeMm4o
         c40PbQ96vwb/IUvLJf/xJG6+uh3ja+vRzyzhf6IYyfcqFfDstqMZqxmqcUcIV/Htu2
         bHfVqi4AeRlLUB93StvpV87dxsq62ZrSi+FyDnu+qTCULW4qETqUiNcyls4mh6VoIs
         CY0lHSxi0gj1WMK6oBm234i+0fbLf+JyYH3doT1lL3Ezv87HLxPLdRPfYRnG0rVaNt
         DRa5MKAiZA1AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGJsWRWlGSWpSXmKPExsWSoZ9nqLtqq2+
  ywY1JVhZvjk9nslj/eyWLxaxNwhYHpk5jtli95wWzA6vH7wOMHptWdbJ5vN93lc3j8ya5AJYo
  1sy8pPyKBNaMRe01Bb18FY+XdTA2MC7i7mLk5GAUWMoscfuJWBcjF5C9iFXi1ezT7BBOJ5PE5
  Hn3wBwhgdlMEh+PNzFBOAeYJI63TmADcSQEjjNKdB9aB5XpZJT48eoUC4QzkUni7N0DUAOeME
  rcWniNDcJ5xCjx+OMpRpADeAVsJVb+nM0GYrMIqEpsPLmHDSIuKHFy5hMWEFtUIFJi38ozrCC
  2sECMxKpFG5lBbGYBcYlbT+aD7RYR+MooceTtd2aoexkllr84wARSxSagLbFlyy+wqZwCdhJT
  liyE6taUaN3+mx3ClpfY/nYOWFxIQFniV/95MFtCQEHi88o1LBB2gkTzlKOMELakxLWbF9ghb
  FmJo2fnQNU4SHTNnQ4V95VYP+MNG4QtJ3Gq9xwThC0vsXPjbah6GYmJey6wTGDUnoXk6VlInp
  uF5NRZSE5dwMiyitGsOLWoLLVI19BIL6koMz2jJDcxM0cvsUo3Ua+0WLc8tbhE10gvsbxYL7W
  4WK+4Mjc5J0UvL7VkEyMwSaUUpVXtYGxb/kfvEKMkB5OSKG/HDN9kIb6k/JTKjMTijPii0pzU
  4kOMMhwcShK8jJuBcoJFqempFWmZOcCECZOW4OBREuEtXAOU5i0uSMwtzkyHSJ1i1OW4sm3vX
  mYhlrz8vFQpcV6lLUBFAiBFGaV5cCNgyfsSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeOy
  CX8GTmlcBtegV0BBPQERn7vUCOKElESEk1MOmdEny9vEC8W3trSec6j7h9e1co8hReW+T13+Z
  Webj/vMvu099JzvI86PX2vvZ1zrnevRteep7earL3tECpssKZdX1p3wTmnD6e4PT5W9zdnzXB
  a07Wf0r61l2huOneOcmXmstL2n+nXXl9beG7z/EFMbsemgnfnP7lHEvl46DH+ywqXaUua7PdX
  /OXQWjXR++WhNXitRf1FAXjSv9FL597isl2gcrkKc5dO2xTd32NLn6UcDA2/W7Y9I/C0aLe50
  097m8NUv799MC5uyFbom6+//cndvmX9lAdblcRngCOZ+xTwj+vjft0KiBSVXKhqpfE05Pa963
  ffkpROe7lIsrrL97XV/s6dCfX/H81d1mUWIozEg21mIuKEwGNgjx4WQQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-19.tower-655.messagelabs.com!1666037162!103406!1
X-Originating-IP: [104.47.110.49]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21740 invoked from network); 17 Oct 2022 20:06:02 -0000
Received: from mail-tyzapc01lp2049.outbound.protection.outlook.com (HELO APC01-TYZ-obe.outbound.protection.outlook.com) (104.47.110.49)
  by server-19.tower-655.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Oct 2022 20:06:02 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDiXoHHMrqT+NInfFlp5P7BeHoVEDQGqK2Sp346Y2ubaEuJOC3nG8GkHMi1mFcdRmdWG3x8uuwiytxYHLoTqwylOmJ8YVGIO08sEc0V52eysgzXOTZFteZ8pqP/vJy3YayQP4nbnkk1MO5FTdux1kXYRwiEtg4es2rTpjAxs8VHLf9Y1W7ZKStX50WU3ncnHAO1uybw7HmtnI+zdedmPn7y1cQgzFfZTTbHDHws5zeGEgvrouUcDivuri5EhDeVV0xrorv5zMFoJfCNFaf1eTueFbs3/Y58dm9kfCF2DITCPkzdrJK8qyOsVR2l/WoSsfo1XuyymbkDtEbefsi+K3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sx8U8WSdREnJO1syRwViBC7gI+lvKbTrn8fC9y8Hlmw=;
 b=D7/PHQeX/M6YCrzwQhkZtjj+Hx9OciAR3DPzwNbp7MhC2KeTkfJj7kPvDtMRVa03hdqeLg/x1J1Hyr4LaT5NaN3KszVUi1HJPBCr1PRvGAygJyamyiNXKXMWe9Wk9AhqpmgizZ/hzPuaT36/7NAf7MxuHHeijDuwPR9sYoTZyNYT4Wf+Ft3EbHcazpasYgihCXMQ9iw6Dvw4i0SD46wfDHqZ0HoF24Z+0kmslUDLc6qR/pJyQcGr4Zz5HVugt/lTdVk6no6eCG7AtVAqJLA9UVrE3gOyp2cQa1PyeuPdU88dX7HW4q3n+Wlc3gfd4Bnn8m47FBowJXU4sYEd3y8CwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SG2PR04CA0194.apcprd04.prod.outlook.com (2603:1096:4:14::32) by
 TYZPR03MB5199.apcprd03.prod.outlook.com (2603:1096:400:32::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.8; Mon, 17 Oct 2022 20:06:00 +0000
Received: from SG2APC01FT0044.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:14:cafe::ad) by SG2PR04CA0194.outlook.office365.com
 (2603:1096:4:14::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Mon, 17 Oct 2022 20:06:00 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 SG2APC01FT0044.mail.protection.outlook.com (10.13.36.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 20:05:59 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.31; Mon, 17 Oct
 2022 16:05:57 -0400
Received: from [10.38.56.239] (10.38.56.239) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.31; Mon, 17 Oct
 2022 16:05:56 -0400
Message-ID: <3c356088-4557-4cff-6623-0334ce54456f@lenovo.com>
Date:   Mon, 17 Oct 2022 16:05:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [External] Re: [PATCH 1/1] platform/x86: thinkpad_acpi: skip
 invalid fan speed
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Jelle van der Waa <jvanderwaa@redhat.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        "Mark Gross" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20221014211709.6322-1-jvanderwaa@redhat.com>
 <20221014211709.6322-2-jvanderwaa@redhat.com>
 <5649310a-b91b-986a-3dd3-c4b04f03462e@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <5649310a-b91b-986a-3dd3-c4b04f03462e@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.56.239]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2APC01FT0044:EE_|TYZPR03MB5199:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eec014c-09eb-4d90-60b0-08dab07b02d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SuApUXkgZbrrsJXY5MWbex55JwKPdsoE3Y+ragq7IHgWJopMvYIOBal7KrMl/qyrDwSaX7109j6+Z6Yrf2avGDuhQwUc9es4gj88Dol94yALwzlcKP9XYdlDkl6nj7OHJ8O6VxgB7EmeG+uAbrNWkHrOYh293eys7Q5b4urYvI921YX677XDlH98MzSZXgtEh80vRgDeulo++mFfIDwwh4eH7cB1p7l0AMTbsZqBgRRs0HyeQvMLarAOUW4JMEkfQZG8g4sVv0VdEJw5DwjnKhZzf0jEO81BlKofgeMhYhK/8kazRPKi1iW3PcEgHcWijhhFksifEhtzMrRNavW/R8od8ZnnNfamdYXtoD8ONP+qYig3jHn9kyc4GfK8dbZ2ihUi5S8VVhXAkle10ECNAO1xnHwcIIWKh9Lve5U3x/EaGSipniP1WArPY0En3vjKXzTXq4fdVZdTiMHVhaG8l2X7rvZ4KoojlAeHarkqMVTDxdwFRe4mG0+QUnwR66/YYK7g0ZGsaQUWh8rDAmCNc0pMX5sv13uGgLjyvz4HDC1Ya5h3K374e3smvynFBbkrckSX/vJpOn1Z9qBbTaMdMqq3eEQd4jCj6uTj6xctVVk98f1qguO0Rh11jz1zdm3AK73DdGk5yFTxox4UUafCboDUw8X/9yyLLVPbdvu6twJf784JUuouH7Zy18ZNZyio8YNhWScWV9pLDkqrNjZwttxG5Jp4TDdfenmW9cJkexd3aHLnjedb/XFrnFy6shkMw9BZIohUxC/ix+LfmGIuFwkPvms3HSS3CJtw9aWPg4VaAEsb0yPDNN/vDHcIakfbZ3+h7ek12dUJa0wmIpxYY/UwZ3avuo1ULpMIWhL4NDk=
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199015)(46966006)(36840700001)(40470700004)(8936002)(82960400001)(82740400003)(83380400001)(31686004)(41300700001)(5660300002)(316002)(36906005)(70206006)(47076005)(426003)(82310400005)(16576012)(16526019)(336012)(478600001)(36756003)(70586007)(53546011)(8676002)(26005)(2616005)(186003)(4001150100001)(86362001)(31696002)(2906002)(36860700001)(40480700001)(110136005)(81166007)(40460700003)(356005)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 20:05:59.6194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eec014c-09eb-4d90-60b0-08dab07b02d5
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0044.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5199
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


HI Hans

On 2022-10-15 10:22, Hans de Goede wrote:
> Hi,
> 
> On 10/14/22 23:17, Jelle van der Waa wrote:
>> 65535 is most likely an invalid read.
> 
> I wonder if it is an invalid read, or if it actually is a reserved value
> which means "FAN_NOT_PRESENT"
> 
> I'm tempted to add:
> 
> #define FAN_NOT_PRESENT		65535
> 
> and then change the check to:
> 
> 			if (res >= 0 && speed != FAN_NOT_PRESENT) {
> 
> 
> That would make the code more logical to read.
> 
> Jelle, can you make this change for v2 ? Also please Cc: platform-driver-x86@vger.kernel.org
> for v2.
> 
> Mark, what do you think of this change (and of adding the
> FAN_NOT_PRESENT define) ?
Looks good to me.

I've asked the FW team to see if they can confirm if this will be
standard behaviour (it's not defined in the spec that I have) and will
update if I get an answer. But regardless I think it makes sense.

Mark

> 
> Regards,
> 
> Hans
> 
> 
> 
>>
>> Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>
>>
>> ---
>>
>> Cc: Mark Pearson <markpearson@lenovo.com>
>> ---
>>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index 6a823b850a77..7e0f72dc53b7 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -8876,7 +8876,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>>  			/* Try and probe the 2nd fan */
>>  			tp_features.second_fan = 1; /* needed for get_speed to work */
>>  			res = fan2_get_speed(&speed);
>> -			if (res >= 0) {
>> +			if (res >= 0 && speed != 65535) {
>>  				/* It responded - so let's assume it's there */
>>  				tp_features.second_fan = 1;
>>  				tp_features.second_fan_ctl = 1;
> 

