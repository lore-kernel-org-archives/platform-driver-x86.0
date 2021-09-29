Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B031C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 29 Sep 2021 13:45:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41AF66140F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 29 Sep 2021 13:45:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344244AbhI2Nrf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 29 Sep 2021 09:47:35 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.5]:36965 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243959AbhI2Nrf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Sep 2021 09:47:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1632923153; i=@lenovo.com;
        bh=rStS7iAxR9MvZZdP8d19ROomWE+GubssmMmcGMi5CIY=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=dZ9q60ZoGwCV6webeYNFn+3kj26DQrupga335IelN3aCWpzlq/tErzIqxU7zkGqTr
         5revmIuM4QGCKR1v+QIuqM+YPwux+cZ125dcKj6Vkk3JHyjPdyJtDUa4Vf3ZpvRG+i
         zFh1FGgEstdsZwTBE7VMuIx5Whj0Q759AjWpJtsyL6eF/xCGSWQJH9J0LcW2+aGN2r
         Mdy+ViIFMP0Gej//cMqRA4APufs/gKA4r0sm1RJFamrI/p41fNpipoT8rohjAP2oO5
         ShblpToqGz6H05OoNS0UuY8EfOShbxp2s8ujE5ewEQq+0QsU4xHyzBn8dxnP8m+be6
         aa3sHfUE9XlYQ==
Received: from [100.112.3.236] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.us-east-1.aws.symcld.net id FC/F8-07361-11E64516; Wed, 29 Sep 2021 13:45:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFJsWRWlGSWpSXmKPExsWSoV9rrCuYF5J
  osFneYv91CYuv326zW7w5Pp3J4uClDYwWrfd+sVlsaz7MaLF6zwtmiyuTbzBanN5d4sDpMeVe
  C5vHzll32T0Wb9rP5vFr2xoWj02rOtk83u+7yubxeZNcAHsUa2ZeUn5FAmvG7f3tbAVvpSpef
  L3O1MB4XLSLkYuDUWAps8Sdk9fZIZxFrBKT366EcjqZJBZ1z2QDcYQE5jFJvJvylR3C2QuU6f
  8BlpEQeMAoceDJLRaITCejxO6tP6B6JjJJHFq1kBnCecIo8eN8Ozuc07nxP2sXIycHr4CtRPe
  074wgNouAqsS1rafZIeKCEidnPmEBsUUFwiUOrZgAZHNwCAPZHy/4gswRETjMJHGmcTIzSJxZ
  wEKi6WghxPyzzBK7N01jAullE9CW2LLlFxuIzSlgJ7F+8VqwXSD1i98cZIew5SWat85mBrGFB
  JQlfvWfB5spIaAocWSePEhYQiBBouffIzYIW1Li2s0L7BC2rMTRs3NYIGxfiQ9XFzFC2FoSBy
  43MUPYORLXFvUzQdhqEvsu34OKy0mc6j3HNIFRdxaSj2chuW4WkusWMDKvYjRNKspMzyjJTcz
  M0TU0MNA1NDTSNdQ1MdBLrNJN0ist1k1NLC7RNdRLLC/WK67MTc5J0ctLLdnECExmKQWMGjsY
  O9980DvEKMnBpCTKu8svJFGILyk/pTIjsTgjvqg0J7X4EKMMB4eSBC9XDlBOsCg1PbUiLTMHm
  Fhh0hIcPEoivAcygNK8xQWJucWZ6RCpU4y6HBNezl3ELMSSl5+XKiXOWwcyQwCkKKM0D24ELM
  lfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMuxpkCk9mXgncpldARzABHVE7KQDkiJJEhJR
  UA5PVV636x/87ZU+usonjCG8TiN2/WHzq6p27FRaJrM5xWbX3y7c7iZb6Vg+27T995FmCP/fi
  g9tK3M/sT7HPWrJeYtZSN5W2qxZTzfl+X5PfGsbqrTJno53F2o1PJu8/uYjz8eTJrNc/xn96f
  fuuLa+tpCdHwt77aWVBPZqeZy7syKh49b7uF4fD3Q+Nr/88/qmpuSBZ7spFzltn5/GW+62fKr
  dyjY6T+9w3GxKvbFB6wdQcffQ+u3Dt/3f739y83fIpY4NGiP2JzAXcX1dM8mz1Wrj45udX4Ql
  Pw2LUVlfurzhfKz4lliGo89v+LUVntJ+8nWEx98LH43yWz9U6QzRuR1zKtuy+H/f84Fv3yZck
  8pVYijMSDbWYi4oTAbbBa+ltBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-15.tower-386.messagelabs.com!1632923151!378649!1
X-Originating-IP: [104.47.125.51]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27579 invoked from network); 29 Sep 2021 13:45:52 -0000
Received: from mail-sg2apc01lp2051.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.125.51)
  by server-15.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Sep 2021 13:45:52 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSgfdygkTmoSdMKu6NQgsybezUZDwasvJgItZLR9QOVsLzXv14AzwVKGBkAiQ5zdvTuFPe3ZEvA5kaMeshLupI5jImm3O5hhEDBfA8X7hYoaK+gZoHbYk8ouMHzBBrNz5dVuti94gVdRnf4+M1Tz+fOgYoJ2LN96Q67FPv5AuBd3lsvYemjFNsc+1cLUopLgzSnkdSrCnY5Upoj6k9l8oWJgBBGp1gwWmShvkETWVqmpoiqvsafCa+bao5X2FfAyDnYMyR0cfryBElpaMqPuks3IiSg1p0rajJ2K/NoMRiPAhy0hz/hGul24HpFVHzhr9LqqsDekXmf876VUpyxIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rStS7iAxR9MvZZdP8d19ROomWE+GubssmMmcGMi5CIY=;
 b=eXyzxZx3ZpZ0xos8Tq9yhsaQOUQh0iNDB6xuzk91V+kfaNfB7g5pSbtdkhSkoCKpIHYEFdY/0q+5+kkEyUR173a4m4vFqs0TDw8/vhKT5Zu3KHGt+X99kZtL+nscxxqyu1NCUWnbZAYzF2/gdxLWOUXQP6PuP+8fqIwyw1j/sm+gPA+yk/6h8eDOoAJv9+R+8OOcxOhffLBRjDG9KtBtTQfnSf+tQ6EEZX+5xUG14ekmRv6lYjNoqwU/ndzj/ZQq642Yrl+cehAVsmtx8xv6kWSw0dwP4a4dI4OoWGGd9JI4Co7OphBspaTiNCf/oLdoGF3CxQ2Zg49t1sQG88k3Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SG2PR0302CA0010.apcprd03.prod.outlook.com (2603:1096:3:2::20)
 by KL1PR03MB5126.apcprd03.prod.outlook.com (2603:1096:820:16::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.10; Wed, 29 Sep
 2021 13:45:49 +0000
Received: from SG2APC01FT061.eop-APC01.prod.protection.outlook.com
 (2603:1096:3:2:cafe::a) by SG2PR0302CA0010.outlook.office365.com
 (2603:1096:3:2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.7 via Frontend
 Transport; Wed, 29 Sep 2021 13:45:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; redhat.com; dkim=none (message not
 signed) header.d=none;redhat.com; dmarc=fail action=none
 header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 SG2APC01FT061.mail.protection.outlook.com (10.152.251.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 13:45:48 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2242.12; Wed, 29 Sep
 2021 09:45:46 -0400
Received: from [10.46.192.198] (10.46.192.198) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2242.12; Wed, 29 Sep
 2021 09:45:46 -0400
Message-ID: <8c91bc0a-1701-ec01-3bec-3a520891c45c@lenovo.com>
Date:   Wed, 29 Sep 2021 09:45:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [External] Re: [PATCH 1/3] thinkpad_acpi: add support for
 force_discharge
To:     Hans de Goede <hdegoede@redhat.com>,
        Thomas Koch <linrunner@gmx.net>,
        =?UTF-8?Q?Nicol=c3=b2_Piazzalunga?= <nicolopiazzalunga@gmail.com>,
        <platform-driver-x86@vger.kernel.org>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Benjamin Berg <bberg@redhat.com>
CC:     <jwrdegoede@fedoraproject.org>, <smclt30p@gmail.com>
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
 <2ea2d9b7-4a15-6aea-1aff-4e1cb80a026f@lenovo.com>
 <ac508b49-7958-3afa-25cf-416d701034e3@gmail.com>
 <ba6698de-1700-fce9-6bca-12ee577ac09b@redhat.com>
 <943fa4fb-273a-0a36-4919-26c05ae4a534@gmx.net>
 <0eeb17bd-59f7-075e-f789-3814cc9a0505@redhat.com>
 <a6c448f7-d0c5-2652-46df-590085b47bd1@gmx.net>
 <d486c621-2464-8763-553b-3543d0578b58@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <d486c621-2464-8763-553b-3543d0578b58@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.46.192.198]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90faa65b-9da9-4394-7edb-08d9834f7265
X-MS-TrafficTypeDiagnostic: KL1PR03MB5126:
X-Microsoft-Antispam-PRVS: <KL1PR03MB5126FDB75BDA7DCEECC65F11C5A99@KL1PR03MB5126.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xTZyO5ItayxIPgkzelGTgorLyJiyoBJwH3XdcPURYu1y2KjLQJd8OZ6fcZNvN0sTH8JAUbVXQShLIMr8Y6nqcokHsuF85ddfl/OpsCgZi31zMiQzs0DJFLmsMGDAQMNfJtEt2JvpFr4+2fq1Hz/IBAGFweQc7TdttpXDvkZuA5+qt96eZ0jMv5SXHqvKhUWg6a5V72BSt0FP9Nbx56zIyC95G127UtaWuL0Rk/cKKCBb6jwy7JOOpBVi25PHJzYQtY6o3zgUaySPx2UBp7Rsj5sK4adxja8V0gDQZC7EI73StPcxmX3WbCrObDUoap6BAo8zeE4EivsGZyjq6jgfsqTjJpIvoQa8jRZvrGO+GyrLG1EkzJk+xiqHAcpseD2ILdJvf6wzMzNjvWzplmo3NZ1ANRDFG1nBf+WHbdONNFqkDMZcjeLa0CX8+lNwDWqkEocvSp1xzUDXRX2AFrZ+oZEC5VUV3cM7LUU71iS5TRiabPtajL/pOwjKQMJmbb/1+U3pxUCll7hldXI3J6qp0vi2nBtzISGzz8eEwK0BoGnPQwJ6N6pXEflgyy7WMtUb6LsoLRRCcNJ8jn/bsICBFMdnHj7GvJiNwnDqKTpButLU6BXObKtLbj2t3G6hCXALMTQQXq3mBI9I76DrXR2/kBAcVMjM3OLhoN4U2X5zXTjasx8zsRGkn8FnDaRLu5nnRC7b2Rot+ddv7/oa20Nz9RXGvOninkmCisKS905olmseWKam+rq72CIEM+IvDLnn893H25pwXmpPdDUvOIx2QWFccDQZNLeKg3bf5UIWSH0=
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36906005)(316002)(70586007)(83380400001)(16576012)(36860700001)(8936002)(31686004)(2906002)(16526019)(356005)(53546011)(8676002)(47076005)(186003)(336012)(86362001)(70206006)(4326008)(82310400003)(31696002)(36756003)(5660300002)(426003)(508600001)(81166007)(110136005)(26005)(2616005)(54906003)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:45:48.9444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90faa65b-9da9-4394-7edb-08d9834f7265
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT061.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5126
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 2021-09-29 06:56, Hans de Goede wrote:
> Hi,
> 
> On 9/29/21 12:45 PM, Thomas Koch wrote:
>> Hi Hans,
>>
>>
>> On 29.09.21 11:55, Hans de Goede wrote:
>>
>>> Hi,
>>
>>>
>>
>>> On 9/29/21 7:47 AM, Thomas Koch wrote:
>>
>>>> Hi Hans,
>>
>>>>
>>
>>>> On 27.09.21 17:12, Hans de Goede wrote:
>>
>>>>> Hi Nicolò,
>>
>>>>>
>>
>>>>> On 9/27/21 5:00 PM, Nicolò Piazzalunga wrote:
>>
>>>>>> Hi,
>>
>>>>>>
>>
>>>>>> On 9/27/21 3:59 PM, Mark Pearson wrote:
>>
>>>>>>> Do let me know if there are some important use cases for these so
>> I can go back to the FW team and discuss supporting them properly.
>>
>>>>>>
>>
>>>>>> The important use cases are force discharge and inhibit charge.
>>
>>>>>> These at present are dealt with using tpacpi-bat, which relies on
>> (out of tree) acpi_call.
>>
>>>>>> See also your previous reply.
>>
>>>>>
>>
>>>>> I can see how those can be useful in certain circumstances.
>>
>>>>>
>>
>>>>> I can also understand how Lenovo does not want these to be
>>
>>>>> available by default everywhere.
>>
>>>>>
>>
>>>>> I think a good compromise would be to add a bool module option
>>
>>>>> which defaults to false to enable these.
>>
>>>>
>>
>>>>    From the user perspective, I don't agree that this is a good
>>
>>>> compromise. Users simply want to recalibrate their battery.
>>
>>>
>>
>>> But can't they already do this by just unplugging the AC and
>>
>>> then let the machine die ?Of course, but who wants that?
>>
>>> How is this different, does it somehow magically flicks on the
>>
>>> AC just before the battery deep-discharge protection kicks in
>>
>>> so no unsaved work is lost ?
>>
>> But this is exactly how it works. There is no risk of data loss.
>>
>>
>>
>> The EC resets the force_discharge flag at the end of the discharge and
>> the ThinkPad is seamlessly switched back to AC power. Just magical. No
>> power interruptions.
> 
> Interesting. So what I get from this is that we really only want
> force_discharge support. At least that is the major one. So maybe
> we should focus on just that one.
> 
> Anyways lets wait and see what Mark has to say about this. As
> I mentioned before doing battery calibration certainly is something
> which is desirable to do under Windows too, so perhaps this option
> is actually fine and it was the other 2 which are more
> "testing only" firmware features.
> 
> Regards,
> 
> Hans
> 
Hi,

I don't personally have any insight - I'm going to have to get feedback 
from the FW team on this. This is all new to me.

Thomas - thanks for the insight into how it is used. That will be really 
helpful to explain what we're looking for. As Hans mentioned we have an 
exercise to try and improve some of the battery related pieces for our 
platforms (largely driven by the TCO 9.0 requirements where I'm happy 
that the product teams are thinking of Linux before the fact rather than 
after) Battery calibration wasn't one of the things on my list, but it 
sounds interesting and useful. I don't think we have it in Windows - but 
I'm guessing and will confirm.
I also don't have any insight into how/why this was implemented on the 
older Thinkpads I'm afraid.

There was a follow up comment made from the FW team that there may be 
conditions where setting this may conflict with what the EC firmware is 
doing, so it will fail. It sounded like a corner-case to me but I don't 
have the details so I'll need to understand any concerns and go from there

Mark
