Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DEFC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Nov 2021 19:13:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350930AbhKXTQU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Nov 2021 14:16:20 -0500
Received: from mail1.bemta24.messagelabs.com ([67.219.250.5]:17720 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350928AbhKXTQT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1637781189; i=@lenovo.com;
        bh=/uOca+X22SM7Ei1HBk/38MPkEHm9HwPPx8mMKVOwSiU=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=XyPKvia3sSeFhH1PzmbCy59j9+ohnbGEsIG/t8vav98lke1E/1doF0jIF++Ii7JHZ
         m5t13KkipGualYhIwVuDwavAQQ/mywfFiXayScESjmSpNxY1HfHW63cVT3y29gxWhx
         97Su6slv8+LLAfFc29VVxlmlx/xrKnEvwCieO92myjlQ/x2boYIWzu7VRms6yM0Qcz
         xDR4vTSyOL6Hld33ai/Q5NWLdalUMrYstoaE+68jb8MVE+L+z1jtBRbbrzj+wD+nR2
         6H65aYfnwfUBySqHZB+Se5uZD1gNTrPC7MG03pOpUGcFpen2o4x2Uzhc81qsVZ3iAC
         h8gLScSfNGdcQ==
Received: from [100.112.129.12] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.us-west-2.aws.symcld.net id B8/31-25200-5CE8E916; Wed, 24 Nov 2021 19:13:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMJsWRWlGSWpSXmKPExsWSoS+VoXukb16
  iwYrVGhaTZvxntnhzfDqTxYGp05gtVu95wWxx6O10NgdWj80rtDw2repk83i/7yqbx+wlN1g8
  Pm+SC2CNYs3MS8qvSGDNaJ7/nLmgXbSi/d07tgbGQ4JdjFwcjAJLmSW23T3HDuEsYpX4+a2ZC
  cLpZJKYPO8eWEZIYAGTxKEv7YwQzmEmiT2f3rKCOBICxxklug+tY4LIdDJK/Hh1iqWLkRPImc
  AkMeVvIUTiCaPE0Y+boIY9YpS4vH830DAODl4BW4kfG/1BGlgEVCVmnb/NBmLzCghKnJz5BGy
  QqEC4xNlVt5lBbGGBfIllnctYQWxmAXGJW0/mM4HYIgKxEvs+HmSCiBdLfDhymRli1xlGif8b
  foAl2AS0JbZs+cUGspdTwE5i+lo9iHpNidbtv9khbHmJ5q2zmSEeUJb41X8ezJYQUJCYtOkuO
  4SdINHz7xEbhC0pce3mBai4rMTRs3NYIGxficU9nVC2lsSND9tZIewciZObXoK9LiGgLnF/vf
  8ERr1ZSD6eheSzWUium4XkugWMLKsYLZKKMtMzSnITM3N0DQ0MdA0NjXQNjQ11jQzN9BKrdBP
  1Sot1y1OLS3SN9BLLi/WKK3OTc1L08lJLNjEC01VKQfONHYyz3nzQO8QoycGkJMrLVjAvUYgv
  KT+lMiOxOCO+qDQntfgQowwHh5IE78oeoJxgUWp6akVaZg4wdcKkJTh4lER4J/YCpXmLCxJzi
  zPTIVKnGF05Jrycu4iZo6tnIZB8cXUxkGyetHw7M8ekI7u3Mwux5OXnpUqJ89aBNAuANGeU5s
  GNhqX9S4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEebeBTOHJzCuBu+AV0HFMQMf17pkNclx
  JIkJKqoHJ4vzJUK1352pZThyduv5TYtBivqm626MzREzPiZ4z2ndKdt3ssKUPZb8cytA9u7Nl
  2YNvkZt5WI5v/naCZVLKa2GuJ/43glLOvzyQnPsjdvWLCdx6bZmrZ6xgeuhzaOIpc79XNU/Oc
  k4NDdk7dd6PcNvG3NssnM1sE1TVNf0fLF0exZs5Xzf946OUZxui87/Li7y4o6X4xVBe48tB4T
  Q/L++L9hriC3gPF1/wVvx3frPyMR/u6Sob/ZXF5u0xylxq3rUs5eiSAwm79X9LcsisDawVfnu
  n4+caLnszoaySWYHfi7ukA6Pn/TH8oNuw67mYLnNEZXHKndt7Z31caMyUFib8WEf//bIZ3+6U
  NH8TUGIpzkg01GIuKk4EALOXazh2BAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-3.tower-335.messagelabs.com!1637781187!29811!1
X-Originating-IP: [104.47.26.104]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14750 invoked from network); 24 Nov 2021 19:13:08 -0000
Received: from mail-sgaapc01lp2104.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.104)
  by server-3.tower-335.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Nov 2021 19:13:08 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkwygLtwFBqcyvL0vn5meTN07yVhtU/+ScMYDNAk4JYSTi9Wv3Zx/hxuMQq+FWImNFh8+x8EsHNyHS/nb52QnXw+5WHbmfw6jdVIitARy36DDDV42BHBwUbIlpGllBoAMly0yjJSqd+3CaME/yNW/UzavEqcfqUQCc9G/RaxQJpVlczIxJMLIFDVpUe6pvIx5gjejrlY0TMOCc9PTg2wPPx7tm4rXRkubv90BZeAtqoDK8BazBGe2WoVDqIVALDLyqKvb3fIL5NrVcnUZWN/GKvP4CXKSYPIHkPy54V81VSVCVrMGdRsdiwCd7ha6IHTzI8hr95mS7MyI9XXabn1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uOca+X22SM7Ei1HBk/38MPkEHm9HwPPx8mMKVOwSiU=;
 b=KFOYF4CeLIuww18/8bimQSOHkh78YGF81dNi2kBBotOhHk25Wc7hc68bkzYOLNwMyPA7FpmaZ1RLwn3l0K48FZ8D7BafaJ9XLFT/2xIaHV29A8jK+z+Zj6LQnDgA0dcMM4+kdfuUHvPMykMcw/YxfQspFg8tZrISWfs1qqEILt2FY2LSLkTPsdgwFEIBQVuYT8wh8Z/jEnDzRsXl4iLvIifOJo1IkHkndmPSNUPp5HKkR1rgdU86xxM8GQbmRD1ObQiOEZ7W9n0VJvwyrcaKlLQZ7ntQbI3ttt3a3YbhPA+NZocySgXgek5+g7GHQdABFx20k2kD7keLB5Dc5ufFAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PS2PR02CA0004.apcprd02.prod.outlook.com (2603:1096:300:41::16)
 by TYZPR03MB5882.apcprd03.prod.outlook.com (2603:1096:400:122::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.16; Wed, 24 Nov
 2021 19:13:05 +0000
Received: from PSAAPC01FT037.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:41:cafe::57) by PS2PR02CA0004.outlook.office365.com
 (2603:1096:300:41::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 19:13:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 PSAAPC01FT037.mail.protection.outlook.com (10.13.38.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.20 via Frontend Transport; Wed, 24 Nov 2021 19:13:04 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Wed, 24 Nov
 2021 14:13:03 -0500
Received: from [10.38.101.45] (10.38.101.45) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Wed, 24 Nov
 2021 14:13:02 -0500
Message-ID: <2cdab9d3-a433-5449-6602-069b7549603d@lenovo.com>
Date:   Wed, 24 Nov 2021 14:13:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [External] Re: [PATCH 2/2] platform/x86: thinkpad_acpi: Add
 lid-logo-led to the list of safe LEDs
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>
CC:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        <platform-driver-x86@vger.kernel.org>
References: <20211123210524.266705-1-hdegoede@redhat.com>
 <20211123210524.266705-2-hdegoede@redhat.com>
 <ca16bf3e-2efe-49a6-94a2-4aeb66f398dc@t-8ch.de>
 <eeaa722c-b1e5-477f-d683-f4e55e50f8b5@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <eeaa722c-b1e5-477f-d683-f4e55e50f8b5@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.38.101.45]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d236f61-b372-4f2e-5d7a-08d9af7e717c
X-MS-TrafficTypeDiagnostic: TYZPR03MB5882:
X-Microsoft-Antispam-PRVS: <TYZPR03MB5882E672D639854AA1DD13D2C5619@TYZPR03MB5882.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: flIGR8scjeLTZQyekgefaXZj5glfdpIi6Tuw6ZS6vXp/MIzhT+AUuioDvk727PxZsYpnCWpYENECxvERQd520x3vCnITc5SjV3AiNcph4BOFilMfBLN/+HWVuw7s4VZPBXlkOy8YP80SMndSLhq+wn/s3rW+cOPbwJ/nECioDQEjh5hr677BxQxb4OY9jZ63M+WW4AFQlj6vGfhlbKkS4yhvLyJniHrTklrfcMsO3qJToDCoeUc648XCElBIOjXGWQDUMi7sqluX/RbxSuA0xcfj6HTOv1B6emf+Vl7LqVU/gAqWWvntyyTlzey7HApTNFFeSUtFcfxHLXvUypCbZNWmKnwbFf+2mQT/90Pxocw7e2Kkb5yaRYSBNN+IaJCY4WDYVVdp3GGbF7viRZGZ81yIU/xJTFCyTtXFQV6qflhD6Xn93ptTLdDRxrJMq3Vjd4dfNWSvXhzcVo06h5ZbXbzhXqYKJzz1RFXuDqlHrDz+xAM3KD7iUjnSvc5Ah7lyPZgO/Gd7WNZGI9U/tqgi0uRc96ElvgIueHn/NgsifZGS+JqXDORfbu6kA6XCOCY411SVYgawf4FUcGGGY1WO5Eo+Hgb7+JuRRusRNeL4gl1fjMBJM2zAEj63ObxiRc+fH8AAd+B+AeCTmh7Fn5YTX1WcR+8Nyds3G4KIg/V2RpEgUZEpnu6J1uPaugegT/GoPHjxk0EwNhhiFkm89l6U5THERS9+62dFPtunoOuYJoOMRDMuaU0Mc3jYtuMvEJz1l3yHULlrcxj/0EexUA+tvJ5Uxf1WH/6F+jZW09pqjd1gIzmPu5ouxN1TR07tq5TWiye6e4QNR2EnFNNMB+P7nxavPUyhnbBjvUUb9ZW0BvpyzEFWojq+IvaxZNr66VffHEfpybyT04zpEscv6VUvKE1v93Oab6liOamEKG2w/A4=
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(53546011)(5660300002)(4001150100001)(8676002)(26005)(16526019)(186003)(336012)(82310400004)(83380400001)(8936002)(316002)(70586007)(16576012)(54906003)(4326008)(110136005)(36906005)(36756003)(70206006)(2906002)(86362001)(36860700001)(82960400001)(31686004)(966005)(2616005)(66574015)(426003)(81166007)(508600001)(31696002)(47076005)(356005)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 19:13:04.9964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d236f61-b372-4f2e-5d7a-08d9af7e717c
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT037.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5882
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 2021-11-24 11:28, Hans de Goede wrote:
> Hi,
> 
> On 11/24/21 16:53, Thomas Weißschuh wrote:
>> Hi,
>>
>> On 2021-11-23 22:05+0100, Hans de Goede wrote:
>>> There have been various bugs / forum threads about allowing control of
>>> the LED in the ThinkPad logo on the lid of various models.
>>>
>>> This seems to be something which users want to control and there really
>>> is no reason to require setting CONFIG_THINKPAD_ACPI_UNSAFE_LEDS for this.
>>>
>>> The lid-logo-led is LED number 10, so change the name of the 10th led
>>> from unknown_led2 to lid_logo_led and add it to the TPACPI_SAFE_LEDS mask.
>>>
>>> Link: https://www.reddit.com/r/thinkpad/comments/7n8eyu/thinkpad_led_control_under_gnulinux/>>>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1943318>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>  drivers/platform/x86/thinkpad_acpi.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>>> index 49fdf16b2db9..28f0299ecab0 100644
>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>> @@ -5661,11 +5661,11 @@ static const char * const tpacpi_led_names[TPACPI_LED_NUMLEDS] = {
>>>  	"tpacpi::standby",
>>>  	"tpacpi::dock_status1",
>>>  	"tpacpi::dock_status2",
>>> -	"tpacpi::unknown_led2",
>>> +	"tpacpi::lid_logo_led",
>>
>> The suffix "_led" looks a bit redundant. Also non of the other LEDs have it.
> 
> Hmm, good point, but without the _led to me it sounds as if it controls
> some backlight for the entire logo, where it really is just the dot of the i.
> 
> So I'm not sure what to do here :)
> 
>> Also currently the reported brightness is 0 before writing to it, although the
>> LED is powered on by default, not sure how this could be fixed though.
> 
> Right, this is a known short-coming of the tpacpi LED interface, LEDs can be
> set but you cannot get the current status.
> 
> And once set, the LED is now fully under usercontrol, until the next reboot
> (or maybe even power-cycle).
> 
Apart from being vaguely fascinated that people want to play with the
LED (I assume because it's annoying and a small waste of power?) - is this
something that I should put in a request for an API to get the LED status?

I would like to get the FW teams point of view here too. We use the LED
to show if the system is suspended or not so I'm somewhat curious as to
what happens if a user overrides the setting. I doubt it's a big deal
but I'd like to double check if there are any gotcha's.

As a note - I added a comment to the Fedora bug linked above too...not
related to LEDs.

Thanks
Mark


