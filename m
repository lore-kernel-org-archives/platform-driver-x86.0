Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C859C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Nov 2022 13:28:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbiKXN2k (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Nov 2022 08:28:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbiKXN2i (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Nov 2022 08:28:38 -0500
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02olkn2107.outbound.protection.outlook.com [40.92.50.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB49CFA64
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Nov 2022 05:28:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjHZjZYtR5SRnpk1di5AsJmiObf8muS1fCkKbbm8hN3nGgAp9zzXAJpNpAsit4ZJHGnFo14AIhnqZsgHP1jK0I/wuLJiQ6x9UtfZNOwthCKGExQWf0LeDF7ImohZXR04hQl+3mBGjJ+THUsP1V4A9tO3piXHE7z0Pe5K35EfCh5/FZRATlAxVe5IDpPfWnNIivqbdJTJrzUH4BIRziueonbpsk2ADD28gWzaxWzR371jx7Vh93361ZlhIuBb3m9ylcXluOnJskaFvYnjODoOu9Zw3rmtBhxJgHrkSQf2YolgRTD2MXfgKXHHUvlXHZ1pn5621Anz1dgcH8QxpG3BmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dl1oTscrS4ctSQeh/VMApBCFs7L3YST2sU62/X0KwTs=;
 b=nyhrRI82aaYTVRnYSc6Bwy+deww0TSiH+cr5QaXUsZdDe0flufL+k33DwrFQ6cjQwkDtf53NdCgNCiR9DEkNl0usi2tauwp/CiG29l8xJoUKPXLvor8gJn23fCYgAIhlrmkJirgjkf+AqhLT22ATMZOAAnfLIL8jcBO1iWjqFDHJE0AUS1xvpxxZQWXLrmXJR0dUwSPVjNj6tawRsH4+oKzwlJke44O8LtL4xMRuKxbjOFtOGB1x4J6+bfGGOeiHI+gtlbW/VU9jGzRKu++3roNXze2ViNhNfrrtjihwpeyjF6kUldgVcSw1yZyei+U62zSt2lx920PT94uWX2fLbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dl1oTscrS4ctSQeh/VMApBCFs7L3YST2sU62/X0KwTs=;
 b=FJETqHYF59orGWjz1p/hja/tb4RqSBs6Z+rSomI4LcjKdSJnWItmiL/kWFm2kUY3MU6tYz+fdUpw1b4sm+xTvkEfiWQin75QjVGb1eWrgcdmI0zBtuQws6D4lVWMvUWeU+wSIiANOL0Mb82gSLsTQw5jJICpBHy1eQRqYCBDxZCJvsOprldEQqSWNBrDEiKb1RWRIVgdc8PPSeticdGLECJzSQDcdG2wnmr2E4j/NovWvvI2Yui3m7LRnr2GFS33ZcGkbcUlYbH9QK8zZKc41vLXz7op/zdreDfi/VJaFqhPwDUU/lkDTjBvYFj9vfp4W34OKPW537RPxeFL45Afxw==
Received: from DU2P193MB2114.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ff::14)
 by AM9P193MB0824.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Thu, 24 Nov
 2022 13:28:33 +0000
Received: from DU2P193MB2114.EURP193.PROD.OUTLOOK.COM
 ([fe80::a05e:c8c2:6878:88eb]) by DU2P193MB2114.EURP193.PROD.OUTLOOK.COM
 ([fe80::a05e:c8c2:6878:88eb%6]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 13:28:33 +0000
From:   Susan Lewis <susanlewis51@outlook.com>
To:     platform-driver-x86@vger.kernel.org
Subject: Re: Blockchain solutions
Message-ID: <DU2P193MB2114AEE3C6F9444613430F21C60F9@DU2P193MB2114.EURP193.PROD.OUTLOOK.COM>
Date:   Thu, 24 Nov 2022 18:58:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-TMN:  [furkIit+bafICp176Uj4VH9ofuA4x7KT]
X-ClientProxiedBy: PN2PR01CA0158.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::13) To DU2P193MB2114.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ff::14)
X-Microsoft-Original-Message-ID: <f12f6629-2b76-3a45-b9ed-16155b5b4602@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2P193MB2114:EE_|AM9P193MB0824:EE_
X-MS-Office365-Filtering-Correlation-Id: 612ba7ff-837d-48bd-787a-08dace1fc8b9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ctlC54wmQzupLoHKxu29kdEVqJZWclONRsZu7I4WGIy0AWryiN0LvOy0DKSsUAtbQPVy9HOJjXBC0pLFF/ADgxV9aL8gUag3FsWeW7U6pwYtDAYt0YBOLMY2UNqdryjAPFsj2K4Xt8ydtI1FQc6u4OrbT/PSvVpZrspx6sOsXE7dEL/pnf0iWXjNpigURM9bQnczltwhQWTwwRrlOM2TORwo2rITMhc+GeO0aaAn071owkAbwJMkd01A93zW+OFdN2Pkh/nMLrer8GYWRm4Ajl1dUkneZXQn/OVp1kv4pMGG5JIl0Fw1lteCxKzCMsubYJfK3yoS1JNLL0B9leSLg68hoRasoPqhqS1xKtv0Q48VCLERBEtHU5RkJm0rZZy9Yi3FELdRQnh8DE103yNX7onC0jotIp9Jbs7YFjTQZoghdqaYtLXtQ8G5EnTdtktVPGn8kxoRUaK5/zAkedOU6pChZ6E/udPN3g/0CL1dZlqwo7zqtnC+tTzu7uO4l5gy40TuAnRolOK36bT9Ti+WhsXGEzmC4dKFJZ0eJ9X/Qf1DzquBoBv4jRd2ylhmsngX1JtFGi8HTGUVvJFBlqmwnZzfATqCYh8qLo/e5uFL+874+rVzOlVX2mw6nE99/GWcLHruaB9r0XcVhPamzaJiAQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVQyOEV2MHV1Uy92TTJsSEVEb0d0aXQyMTBWVHc1TzNaMksrTVVuV3NmL0o1?=
 =?utf-8?B?M1Y2V2lGZEtLQ2w2WTdzd25pWE1OUEd0Sks3eUVZazYvYWQwTU53aytZeFBP?=
 =?utf-8?B?N1F0bW1BTFU1Zk96Wm9jdzcybTRZa2ZSZjZjUi9jR0FpTk1yNDlSR09KSk1U?=
 =?utf-8?B?bHU2c3NIT2o4R3J0NThUdjhoUWtrZHlNemJjK1ZaYnI4THl6TysxdGIzalhU?=
 =?utf-8?B?N0tIQ2l3MTZ3Zkg2cFNzQjNpckJRSm9uRk9ISkxyZ2ZPTURSRVdtQVF2eis1?=
 =?utf-8?B?MXZZdWF4RnFMMVdURUlndHJFNVlTS1JRODdSVXJNL3RrNTBNa0JFT25DVWNo?=
 =?utf-8?B?aW9acXhtMEs0bWFCSmlxTEJOZVp1ZGRCb0wxdytEdkdKdU0wd3lacDc5dk9R?=
 =?utf-8?B?MG8rRit6bWJQOGxTMXY3dUc5aEZxcUcyOVlKdS9SMSsxU2EyU2R2Vk9TSWV0?=
 =?utf-8?B?emhNd3hnSHF6Mm5DdGt5UlVub2E0SEhMTklpNlcvTHZwNDFHc1QvbEZxUnpB?=
 =?utf-8?B?cUEvYVo2Kzl1QURVR0d0eTVMblUxakE5MEQ0bEhYUkRoWnFRdWFOR1E4TzlI?=
 =?utf-8?B?bHVaQ0NpK0JXbkd1bUoyZUYvQ1NwMGhKa3JuQ0JnczZnakd4ZFBycm0rRjFz?=
 =?utf-8?B?cGlFQWRtZlRERkhaNHZoLzlpU28xQnpaQmdERlRiRFNtWUQ3WGZMVjVDMU12?=
 =?utf-8?B?OXNCb1lZcnhWUGdENlNNcDB2bUFUOTY1K1ZNR3hvTTI5VWxyKzI1ZGVRdUZG?=
 =?utf-8?B?NE5sNGpld0FlTkhtUWw2YlkvUXVNTWtITTV6NVpaa3FBcmNmYTduN0Eyd2NU?=
 =?utf-8?B?TEc1RVFoVGtJRDFxT0M4V01td0tvSm80QVFWRjVqcnNFTnFrMzNRVEEreURV?=
 =?utf-8?B?YUw3MFJBay8xVkY5Z0JKZ3ovUngzT0V2c0JReWtoVG1hQTlZa3VBTi80L09L?=
 =?utf-8?B?cVRTQXdsbVM5UzNKRW9ieFVnSjU0SUw2NUw5TElLeVRKcEJmdzlMeGIxZWtw?=
 =?utf-8?B?RVZucnljV1RKQzAzM3NTTUdBdWt6TWpjQmp2aTJlNzJMVE9hejNFVlNuTXlF?=
 =?utf-8?B?Q0d4eC9zWENwWjhhSlE3ZlF1RFlzRE1kb050U2tuaGgvRTNQL0RCWjc4UlRL?=
 =?utf-8?B?SXBtT2doZWpjeUtRajlNMWVyVEEzU3IrN1d0QUNyckZVSTQ4ZEJDNUtYcytz?=
 =?utf-8?B?WjZKZ2gwMHd0YUhvWURrczdWcFFXemRaNDBNL2hLaDFKZG5CQzBRQStwM0N5?=
 =?utf-8?B?NHV1OTJYUEI1c3ZBZ2svUEV0Zm1xVXA4ZnJ3WFhaZTdPMXNRTmpiK04xVi9L?=
 =?utf-8?B?NExuKzBNRHg0VE5tS1FjMmdHMmNPVTV0cEQ0alF3TzlnN09kN0lPSy9aRUJ6?=
 =?utf-8?B?SFBONm9Ga0lYdnVqL3lkb3hkZVJmT1R1bkt4ZU1ZdEk2Wk1WV0JNWlJqby9i?=
 =?utf-8?B?ZnQ4VEZ1ZGlJNzVFNHkvcGVSU2Q3eUx1WWs3OXUvME1OZEdLSUFOZ3hIcG5r?=
 =?utf-8?B?anMzemFrU2I5akdaK0tkQnZzRWNXaVA4Rnp4dWxxZlJtUGJJY1ljcWw0Vmlr?=
 =?utf-8?B?RUdwN3pTamhzM0lTM2FubW9Zb21mbHRBWTZxNGoramNneW94TitOLzM3YytH?=
 =?utf-8?B?ZlBZUTk5SkFEeGxKbFJRWHdPUTcycTB6KzYrZ21MUkF0TDZYOUxBb0tiQldl?=
 =?utf-8?B?L3hoUUIxTjRIVzN0bWYyK3RScTh0RldRMU9jdnZOOG5QZ0dRVDRmWG93PT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 612ba7ff-837d-48bd-787a-08dace1fc8b9
X-MS-Exchange-CrossTenant-AuthSource: DU2P193MB2114.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 13:28:33.8734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB0824
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


Hello,

I am writing to follow up on my email.

Can we get on a call on Monday (28th November) or Tuesday (29th 
November) so we can discuss this further?

Please suggest a day and time to connect and also share the best number 
to reach you.

Thank you
Susan Lewis

On 8/8/2022 2:27 PM, Susan Lewis wrote:

Hello - Greetings,

We are a Software/IT development company. We build Digital Solutions 
using emerging technologies for Startups and Enterprises.

We can help you to become a game changer in your business segment, we 
deliver enterprise blockchain solutions that go beyond optimization of 
workflow and resources. Get a resilient ecosystem to privately 
communicate, accelerate critical processes, and continuously innovate.

What can you expect from blockchain?

     Automation
     Eliminates duplication of data
     Enhance data security
     Reduce risk

Solution we offer:

     Blockchain Smart contract development
     NFT Token and Marketplace development
     Crypto Wallet development
     Defi
     Crowdfunding
     File storage
     Protection of intellectual property
     Cryptocurrency Exchange Software and more

Can we have a free consultation call – we'll tell you how to revamp your 
existing system or hit the market with a new solution?

Please suggest a day/time and share the best number to reach you.

Thank you
Susan Lewis
