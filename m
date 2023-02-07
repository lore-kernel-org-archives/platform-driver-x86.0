Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6D4C636CD
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Feb 2023 23:23:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjBGXXr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Feb 2023 18:23:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjBGXXq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Feb 2023 18:23:46 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90EC63E638
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 15:23:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfJb/6F4nwJx+/Hp+7I2wwEWfPhXBy6jzLZUwdT2E781UiMKTFctm+GktrczxNZmoHoTKHBejPiETaBmDpYzbylywbQzye5ZaHyySdukXq8CF/BWujs3yoVkUwtjV6WSHmonGkmH5ZV61GuisIFzTx173buhVgUPAMo//IPR9vaza6RS4gZyLhGFCTG3qETdFtS/NGNdo9nb5Hw/wRw//0swp/GZcmtpwPpN2ll5g0kf5qG4CZ5a8IKgi/Srzpv5PulUOqhNhVExI7QDroL/f8id2ifDgnUFXwXvUwxW+5MGECKEyqCq4Kk9KG8ojk+sU+3jL/bU3M/uH/ABM7sQgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLatf2QUFQ4PjVUKRsCBn+0bh5aov6QDBqyh1Usn6Q0=;
 b=Io0Ua4uUgysPUaHmNQW1uKxIAnvK1yW4ZCkdxyut6XgrCTEnVU4z1CIc/wgS1vvtQEx3blhDzzMqqlArApTkdAHhbxJ9l7pR+iTXan4kmyV/UvbmW3UEqzQB7HY3TpbdpU3XbubtSgsjE6V1dYxQnfq9e4oCQxIO48QAERbyzNYbkdIy1q6SB4GYWvcxdmZzOBiZ4KvvYEj6NKD+VVeD7VI2vQy9McFBjIbCZMcmMkiTF/me/lIfbT5wi0aMQlE6JrCYte70xifud4Q0Ju/TaTKACzd7yBe9QZaFHKTvR6INzaNrFG43TFZHrbaxO9Q+Oo3ciyX4e/JgvEp6gfKHww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLatf2QUFQ4PjVUKRsCBn+0bh5aov6QDBqyh1Usn6Q0=;
 b=Y4zi4wsJx1yvSbmzz2wHhc8hatec/DCU8X2TYp5tiePjtJ+wOeK3ujypneEazwV6SYJg8BEpGB8mhTWG0kcrFNoYVL+abLQcRq5yc9ZW8+OO1c0Wpo8TiiL0mGfYAwz/JYVzFti+kwt1x1aGmg1CoVTv1cAFk0GVRzwzz6uPIZbSgHEdTOLi4nmJN963k7+HdWK4QacvmuV+wsvQ9GVgMukekiIjq8RbIPgW56x2emIQH3R7m9XEZnZFrdcLjVRg49BX2VE0PK1Nu/P9RQtpyC30DUNd8zB1NPnNMq9u45I5IyRynpM03t6DKFEmzg7J7LSSfViQfglJ5CeAtU7KDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 SA0PR12MB7462.namprd12.prod.outlook.com (2603:10b6:806:24b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.34; Tue, 7 Feb 2023 23:23:41 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6e75:2e:a53d:a7a]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6e75:2e:a53d:a7a%6]) with mapi id 15.20.6064.027; Tue, 7 Feb 2023
 23:23:41 +0000
Date:   Tue, 7 Feb 2023 17:23:38 -0600
From:   Daniel Dadap <ddadap@nvidia.com>
To:     Alexandru Dinu <alex.dinu07@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v2] nvidia-wmi-ec-backlight: Add workarounds for confused
 firmware
Message-ID: <Y+LdeqVV7Oig6hqt@ddadap-lakeline.nvidia.com>
References: <0fbfd32e-904d-1e04-8508-e863c357a2ff@nvidia.com>
 <20220316203325.2242536-1-ddadap@nvidia.com>
 <26e0d196-5b2d-6bdc-8cbf-19c5bb9736e4@nvidia.com>
 <CAJOTRr6J7-E_dt+zbh6S=rg62PodsQBXYUFhxJOAqbj4w=ns=w@mail.gmail.com>
 <Y9g96nNy5iJFBy0L@ddadap-lakeline.nvidia.com>
 <CAJOTRr7Fek9PKSkJHbqZQUy8awXcVeVc=K1sXhqEUbjEXaSfQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJOTRr7Fek9PKSkJHbqZQUy8awXcVeVc=K1sXhqEUbjEXaSfQQ@mail.gmail.com>
X-ClientProxiedBy: SN7PR04CA0227.namprd04.prod.outlook.com
 (2603:10b6:806:127::22) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2763:EE_|SA0PR12MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 54111c7b-32ab-4e9d-1158-08db096258ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M9ctRInOO0mi4MCw6XicB9nHg7h7ySItKlQsqzs+rBQbsvqHFgmZK7BdKMEQeM/19Rk9PIQVVPgSBOZ4b/R6SBXoA9s40TmAWkOeXbJSizCQXybd15gpixBnTxyVQdB2fV24Rk6ilQV3zp9DUrGX/RlMmClfB54GzDOqdp8cbFMQ8eyUbAb3nti2Ogtb4X7ynDWB7d4yxEbQCFTHCyNSiQfP6oDcNpdOCNu8t+UuLHhcbrFtgBZNI0ZasjbqppE12lq2zmDD/a11XbSa4Rxd914lDYX9JBhsuvoeWZG5HkQ+GPeUEnMtNlKMNmF2L+VnqCc3O/Rn8GIIkByONaT/bU1slOlCASwk2kKy3UEXwrKIrQQ5u1JlDAVLOh3z6CRIPdhlLaodRO7P+tCbeSKg3bNwbY1jWNuELLnQYX0V5GxerYjJgPcSC1Hnn3t3mQpetQ/Gnl6TSj0h6xYYlVwKAS6dGybM6RGh5AvMaKPi7MMP54777iFZoXKuahebnTECfKGq8gI3mbdGJJ1jjTqwswdp2zAqtVE8Wesza/XFwM73rmKuZQXUtUqh9VgWMh7GOpNiEjJm4WO4g11cqOcxg5pC/mUOwBe7XLq3GjumWgmi9cwySlYj5CHnAg35AkSh3dGV9gliEATF+2qFog8UVUoACCPZ1eN7VtpeX49RCfFFtIjQFq60necj6sKC0rSv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199018)(6512007)(41300700001)(6486002)(5660300002)(66946007)(316002)(6666004)(6506007)(54906003)(478600001)(53546011)(66476007)(2906002)(6916009)(30864003)(8936002)(66556008)(4326008)(38100700002)(26005)(8676002)(83380400001)(66574015)(86362001)(186003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVNPdzkxTzQvYjloV0l5cmd2bEFXK0dUL0NsNDZKWlhhTGhUb0Q1b1IwWnh3?=
 =?utf-8?B?K3FJaUxScUtMM3JtdHZBejRieWtLTkhuVVF2VGZUenpaaW0wd0JyMXpGbS9E?=
 =?utf-8?B?VDZFamNqb2pqMW1BbVl2Vno4VU1ybFNJeFJMQm9wTktXZy9vTWYzaWlCTmJt?=
 =?utf-8?B?ZlVteFJtVm05NUFHS1dSWGh1RDR5cjdoUThzWFduTzZEaDJHRmQyM3JwRlk5?=
 =?utf-8?B?QUp3RXJ4ckU1cHlHbjRFNjBlaUZCNUhOL1Z3c0o4ZFg2SjZ6MUlJc0kyQWI4?=
 =?utf-8?B?L2E2TkloRGNGQjRtVDl5dlNZbzJPdVgyUjJBMC9xRG12SnhIdmcwRGZXdVAy?=
 =?utf-8?B?OWpoZ3VkR1M0akZTaVVhUmlQMCtRc3VjenY3eXQ5S00xNi96MmN6aGVUaTl1?=
 =?utf-8?B?U0tNcnNTUUlBMlNWVGVvamJMa25LMmwrVklDTjJRMnFUT0lVcUNJTU1GdlBV?=
 =?utf-8?B?a1dsdXY0SG1RUU5BdHpINjBpN3phemVmV25PQkxyR2NxZTNxZEN6QWlCN2pD?=
 =?utf-8?B?VFZRYTNCOWpBMjlrSkFUbHZoeXEwazNxWVFGQ0VqMWtLdzRzS1ZTVElRcTBr?=
 =?utf-8?B?b2FzSGNISnVxTlBERjJROGEyRDkxanlzbFdFY0ZhSE94cXpkRTRMQUUvMldS?=
 =?utf-8?B?VDRocU9RNG95cmcxeDBsbkFTKzlIODY1YTkveUF6aUZUQ2luVjIrTWJJR2dp?=
 =?utf-8?B?dGVXUGxHVHM4OS9UUnlrazJBMHd1TzNNeDhZL05KRHZEaHZJU2N1Zlp1dkNh?=
 =?utf-8?B?U25FamFkVzhXZUM4RDgrelM3MC9tZW1ta3duanY2b2hidkcxWEZtOC9JekRy?=
 =?utf-8?B?MlNEZ21ZSk41Z29rL050UlNaWGNJYTVaSjA2TGpiMWVSV2luT3NyZFRkdm1L?=
 =?utf-8?B?Q1ZLUHBXOGdBcXplblNJRmF5M1RHQ01rUC9RNk5ET1RvZjJXdUNBeVpSOEtq?=
 =?utf-8?B?cHAyeW5hM1ZXZElwVU54NThnQXErejgrb3pQczcrWWQ0U2JqMUF4M1BlV2Ns?=
 =?utf-8?B?MW9acHFBd1NSRUFWRGxFMlZKL1lqSGZSdXhpL1J6RkVmNGk1dkdFaE5LL1hh?=
 =?utf-8?B?SFFXZlpEM0p0TmpCK2M3WE5WaFhsdldZSmd4ak1jZVltbHNmN1h2d1NzK1Rt?=
 =?utf-8?B?NnRCOXFkYzNyci80emd5c3lRd2puR1BNWjVvaVo1dEF6U3Y2UXgxaTVpZFRt?=
 =?utf-8?B?QzFyRk1LeHpIb2FET0J4a2N4TGtUNzU3cmh6cHpQdXBrWXBNQzc0SGpoQlNy?=
 =?utf-8?B?a21WcFV2NStsL3AyR1M4UVViVFFIblJYcDVaYjQ2RVdlUUwrS1N0ZS85NFhX?=
 =?utf-8?B?WVRwakRJc2tGVmRSQnBWa1FmUm5sVzVvcEdHbmpxSHVXbmtQUkJBcmFzWnRk?=
 =?utf-8?B?SU1iZzZFSFJkUXpsTDNwY3hzNDYycEVFOFNOdkM0QkhWSGNKcEJ6RHlrYklK?=
 =?utf-8?B?Q05salMzYWo3QldITkRSbWpHb2VCckJydDdTZ2pwaEZpQmRwSkRVVlpLQVNm?=
 =?utf-8?B?ZjJoRm9IWVhwSEFPaVJBOG5Fci9mbUplZ3FJcGVacWJJZjQ3dk9XSmNRQVNv?=
 =?utf-8?B?SE1zYm5qNzhDNWhUYi8zY3E1VmJ1OU5Ycm5nM3BhTTJUQXNTd0ZoczBzSjdr?=
 =?utf-8?B?aWJtTlRzdEFnakNObE85NzBTK215ZFhrVk5HTWVrRFA0b0IyTHFqWUFQV2sw?=
 =?utf-8?B?bVhlczRyK3VPeTFpVlVza2wrZCsvQWhxdnRLN3VxTGhhbWQ4Zjc1c1BhTlQr?=
 =?utf-8?B?RDZjQXFwVEE0RDgvQXM2RzQyNkxMaXhrZlNZczB1QnpBQ1JZT2Z2ZmlFRDhr?=
 =?utf-8?B?TUw5aXJReXJCUldhRllreEdIcDQrcEh0UktuclJtWUpFMlppUklLeTNxL2lF?=
 =?utf-8?B?amowQWRQdEc4Um5EdlFRN3ZFQXEyN1YzUTg4ek1uMW1hNm10MnJXSXE5L1Zz?=
 =?utf-8?B?eHFxc1BrQlVsaVIvOXVpeEdST0xIVjduYzF0ZnBoMXhpNzUzV05HQ3dxZFdy?=
 =?utf-8?B?cnAydVBNNlB0ZTUrMjdYaUFYdXdGcG5jUHJRRCtmSHlqQjVzaGNwQXFVRk9O?=
 =?utf-8?B?Qi9kNExFUGpHaVppUW1zK3RsdTVjRzdSMFZxcm1lVXI4eEZmVzFQeWJXaTA0?=
 =?utf-8?Q?Vl6z1ZWZZuwKI72JLAHIjApvH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54111c7b-32ab-4e9d-1158-08db096258ff
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 23:23:41.0425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0dijDpoIi9ArOa5gWR7Wykh636Hi1+7GXioiJwvp8sEqswNoC5+QMEwTWpwu84nrGQQt/1D5eT+nZt5nqtu6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7462
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jan 31, 2023 at 09:56:03PM +0200, Alexandru Dinu wrote:
> Hello,
> 
> I updated from HACN31WW to the latest HACN39WW and tested on a fresh
> 6.1.7 kernel.
> The brightness issue is not fixed -- same old behaviour: controls only
> work after an initial resume from suspend.
> 
> So far, I've been using your patched version of the
> nvidia-wmi-ec-backlight module which worked great -- manually patching
> the module after each kernel update.
> 
> > somebody else reported a similar issue recently which appears to be resolved by updating to the latest firmware version.
> 
> Can you please point me to this reference?

It was a private report - I've added the reporter to this mail thread.
Unfortunately, it turns out that the "works after update" behavior was
actually a case of the backlight on that system coincidentally working
for a while after the update, before breaking again. On at least that
system, the backlight controls occasionally work as intended on their
own for a while.

> Thank you!
> 
> 
> On Tue, 31 Jan 2023 at 00:00, Daniel Dadap <ddadap@nvidia.com> wrote:
> >
> > Hi Alex,
> >
> > On Thu, Mar 17, 2022 at 12:09:03AM +0200, Alexandru Dinu wrote:
> > > > Note: the Tested-by: line above applies to the previous version of this
> > > > patch; an explicit ACK from the tester is required for it to apply to
> > > > the current version.
> > >
> > > I compiled and tested v2 on 5.16.14.
> > > Everything works as expected: brightness control & level restore work
> > > both on first boot and on subsequent sleep/resume cycles.
> >
> > I ended up abandoning this workaround patch because it was incompatible
> > with Hans's plan to clean up the backlight subsystem. In the meantime,
> > somebody else reported a similar issue recently which appears to be
> > resolved by updating to the latest firmware version. Have you updated to
> > the most recent firmware, and if so, are you still seeing this issue?
> >
> > > Regards,
> > > Alex
> > >
> > >
> > >
> > > On Wed, 16 Mar 2022 at 23:28, Daniel Dadap <ddadap@nvidia.com> wrote:
> > > >
> > > > Sorry, just noticed a typo in a comment:
> > > >
> > > > /* This quirk is preset as of firmware revision HACN31WW */
> > > >
> > > > Obviously that is meant to read "present". I'll fix that with the next
> > > > round of changes, assuming there will be additional review feedback.
> > > >
> > > > On 3/16/22 15:33, Daniel Dadap wrote:
> > > > > Some notebook systems with EC-driven backlight control appear to have a
> > > > > firmware bug which causes the system to use GPU-driven backlight control
> > > > > upon a fresh boot, but then switches to EC-driven backlight control
> > > > > after completing a suspend/resume cycle. All the while, the firmware
> > > > > reports that the backlight is under EC control, regardless of what is
> > > > > actually controlling the backlight brightness.
> > > > >
> > > > > This leads to the following behavior:
> > > > >
> > > > > * nvidia-wmi-ec-backlight gets probed on a fresh boot, due to the
> > > > >    WMI-wrapped ACPI method erroneously reporting EC control.
> > > > > * nvidia-wmi-ec-backlight does not work until after a suspend/resume
> > > > >    cycle, due to the backlight control actually being GPU-driven.
> > > > > * GPU drivers also register their own backlight handlers: in the case
> > > > >    of the notebook system where this behavior has been observed, both
> > > > >    amdgpu and the NVIDIA proprietary driver register backlight handlers.
> > > > > * The GPU which has backlight control upon a fresh boot (amdgpu in the
> > > > >    case observed so far) can successfully control the backlight through
> > > > >    its backlight driver's sysfs interface, but stops working after the
> > > > >    first suspend/resume cycle.
> > > > > * nvidia-wmi-ec-backlight is unable to control the backlight upon a
> > > > >    fresh boot, but begins to work after the first suspend/resume cycle.
> > > > > * The GPU which does not have backlight control (NVIDIA in this case)
> > > > >    is not able to control the backlight at any point while the system
> > > > >    is in operation. On similar hybrid systems with an EC-controlled
> > > > >    backlight, and AMD/NVIDIA iGPU/dGPU, the NVIDIA proprietary driver
> > > > >    does not register its backlight handler. It has not been determined
> > > > >    whether the non-functional handler registered by the NVIDIA driver
> > > > >    is due to another firmware bug, or a bug in the NVIDIA driver.
> > > > >
> > > > > Since nvidia-wmi-ec-backlight registers as a BACKLIGHT_FIRMWARE type
> > > > > device, it takes precedence over the BACKLIGHT_RAW devices registered
> > > > > by the GPU drivers. This in turn leads to backlight control appearing
> > > > > to be non-functional until after completing a suspend/resume cycle.
> > > > > However, it is still possible to control the backlight through direct
> > > > > interaction with the working GPU driver's backlight sysfs interface.
> > > > >
> > > > > These systems also appear to have a second firmware bug which resets
> > > > > the EC's brightness level to 100% on resume, but leaves the state in
> > > > > the kernel at the pre-suspend level. This causes attempts to save
> > > > > and restore the backlight level across the suspend/resume cycle to
> > > > > fail, due to the level appearing not to change even though it did.
> > > > >
> > > > > In order to work around these issues, add a quirk table to detect
> > > > > systems that are known to show these behaviors. So far, there is
> > > > > only one known system that requires these workarounds, and both
> > > > > issues are present on that system, but the quirks are tracked
> > > > > separately to make it easier to add them to other systems which
> > > > > may exhibit one of the bugs, but not the other. The original systems
> > > > > that this driver was tested on during development do not exhibit
> > > > > either of these quirks.
> > > > >
> > > > > If a system with the "GPU driver has backlight control" quirk is
> > > > > detected, nvidia-wmi-ec-backlight will grab a reference to the working
> > > > > (when freshly booted) GPU backlight handler and relays any backlight
> > > > > brightness level change requests directed at the EC to also be applied
> > > > > to the GPU backlight interface. This leads to redundant updates
> > > > > directed at the GPU backlight driver after a suspend/resume cycle, but
> > > > > it does allow the EC backlight control to work when the system is
> > > > > freshly booted.
> > > > >
> > > > > If a system with the "backlight level reset to full on resume" quirk
> > > > > is detected, nvidia-wmi-ec-backlight will register a PM notifier to
> > > > > reset the backlight to the previous level upon resume.
> > > > >
> > > > > These workarounds are also plumbed through to kernel module parameters,
> > > > > to make it easier for users who suspect they may be affected by one or
> > > > > both of these bugs to test whether these workarounds are effective on
> > > > > their systems as well.
> > > > >
> > > > > Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> > > > > Tested-by: Alexandru Dinu <alex.dinu07@gmail.com>
> > > > > ---
> > > > > Note: the Tested-by: line above applies to the previous version of this
> > > > > patch; an explicit ACK from the tester is required for it to apply to
> > > > > the current version.
> > > > >
> > > > > v2:
> > > > >   * Add readable sysfs files for module params, use linear interpolation
> > > > >     from fixp-arith.h, fix return value of notifier callback, use devm_*()
> > > > >     for kzalloc and put_device. (Barnabás Pőcze <pobrn@protonmail.com>)
> > > > >   * Add comment to denote known firmware versions that exhibit the bugs.
> > > > >     (Mario Limonciello <Mario.Limonciello@amd.com>)
> > > > >   * Unify separate per-quirk tables. (Hans de Goede <hdegoede@redhat.com>)
> > > > >
> > > > >   .../platform/x86/nvidia-wmi-ec-backlight.c    | 196 +++++++++++++++++-
> > > > >   1 file changed, 194 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> > > > > index 61e37194df70..95e1ddf780fc 100644
> > > > > --- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> > > > > +++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> > > > > @@ -3,8 +3,12 @@
> > > > >    * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
> > > > >    */
> > > > >
> > > > > +#define pr_fmt(f) KBUILD_MODNAME ": " f "\n"
> > > > > +
> > > > >   #include <linux/acpi.h>
> > > > >   #include <linux/backlight.h>
> > > > > +#include <linux/dmi.h>
> > > > > +#include <linux/fixp-arith.h>
> > > > >   #include <linux/mod_devicetable.h>
> > > > >   #include <linux/module.h>
> > > > >   #include <linux/types.h>
> > > > > @@ -75,6 +79,73 @@ struct wmi_brightness_args {
> > > > >       u32 ignored[3];
> > > > >   };
> > > > >
> > > > > +/**
> > > > > + * struct nvidia_wmi_ec_backlight_priv - driver private data
> > > > > + * @bl_dev:       the associated backlight device
> > > > > + * @proxy_target: backlight device which receives relayed brightness changes
> > > > > + * @notifier:     notifier block for resume callback
> > > > > + */
> > > > > +struct nvidia_wmi_ec_backlight_priv {
> > > > > +     struct backlight_device *bl_dev;
> > > > > +     struct backlight_device *proxy_target;
> > > > > +     struct notifier_block nb;
> > > > > +};
> > > > > +
> > > > > +static char *backlight_proxy_target;
> > > > > +module_param(backlight_proxy_target, charp, 0444);
> > > > > +MODULE_PARM_DESC(backlight_proxy_target, "Relay brightness change requests to the named backlight driver, on systems which erroneously report EC backlight control.");
> > > > > +
> > > > > +static int max_reprobe_attempts = 128;
> > > > > +module_param(max_reprobe_attempts, int, 0444);
> > > > > +MODULE_PARM_DESC(max_reprobe_attempts, "Limit of reprobe attempts when relaying brightness change requests.");
> > > > > +
> > > > > +static bool restore_level_on_resume;
> > > > > +module_param(restore_level_on_resume, bool, 0444);
> > > > > +MODULE_PARM_DESC(restore_level_on_resume, "Restore the backlight level when resuming from suspend, on systems which reset the EC's backlight level on resume.");
> > > > > +
> > > > > +/* Bit field values for quirks table */
> > > > > +
> > > > > +#define NVIDIA_WMI_EC_BACKLIGHT_QUIRK_RESTORE_LEVEL_ON_RESUME   BIT(0)
> > > > > +
> > > > > +/* bits 1-7: reserved for future quirks; bits 8+: proxy target device names */
> > > > > +
> > > > > +#define NVIDIA_WMI_EC_BACKLIGHT_QUIRK_PROXY_TO_AMDGPU_BL1       BIT(8)
> > > > > +
> > > > > +#define QUIRK(name) NVIDIA_WMI_EC_BACKLIGHT_QUIRK_##name
> > > > > +#define HAS_QUIRK(data, name) (((long) data) & QUIRK(name))
> > > > > +
> > > > > +static int assign_quirks(const struct dmi_system_id *id)
> > > > > +{
> > > > > +     if (HAS_QUIRK(id->driver_data, RESTORE_LEVEL_ON_RESUME))
> > > > > +             restore_level_on_resume = 1;
> > > > > +
> > > > > +     /* If the module parameter is set, override the quirks table */
> > > > > +     if (!backlight_proxy_target) {
> > > > > +             if (HAS_QUIRK(id->driver_data, PROXY_TO_AMDGPU_BL1))
> > > > > +                     backlight_proxy_target = "amdgpu_bl1";
> > > > > +     }
> > > > > +
> > > > > +     return true;
> > > > > +}
> > > > > +
> > > > > +#define QUIRK_ENTRY(vendor, product, quirks) {          \
> > > > > +     .callback = assign_quirks,                      \
> > > > > +     .matches = {                                    \
> > > > > +             DMI_MATCH(DMI_SYS_VENDOR, vendor),      \
> > > > > +             DMI_MATCH(DMI_PRODUCT_VERSION, product) \
> > > > > +     },                                              \
> > > > > +     .driver_data = (void *)(quirks)                 \
> > > > > +}
> > > > > +
> > > > > +static const struct dmi_system_id quirks_table[] = {
> > > > > +     QUIRK_ENTRY(
> > > > > +             /* This quirk is preset as of firmware revision HACN31WW */
> > > > > +             "LENOVO", "Legion S7 15ACH6",
> > > > > +             QUIRK(RESTORE_LEVEL_ON_RESUME) | QUIRK(PROXY_TO_AMDGPU_BL1)
> > > > > +     ),
> > > > > +     { }
> > > > > +};
> > > > > +
> > > > >   /**
> > > > >    * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
> > > > >    * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS_GUID
> > > > > @@ -119,9 +190,30 @@ static int wmi_brightness_notify(struct wmi_device *w, enum wmi_brightness_metho
> > > > >       return 0;
> > > > >   }
> > > > >
> > > > > +/* Scale the current brightness level of 'from' to the range of 'to'. */
> > > > > +static int scale_backlight_level(const struct backlight_device *from,
> > > > > +                              const struct backlight_device *to)
> > > > > +{
> > > > > +     int from_max = from->props.max_brightness;
> > > > > +     int from_level = from->props.brightness;
> > > > > +     int to_max = to->props.max_brightness;
> > > > > +
> > > > > +     return fixp_linear_interpolate(0, 0, from_max, to_max, from_level);
> > > > > +}
> > > > > +
> > > > >   static int nvidia_wmi_ec_backlight_update_status(struct backlight_device *bd)
> > > > >   {
> > > > >       struct wmi_device *wdev = bl_get_data(bd);
> > > > > +     struct nvidia_wmi_ec_backlight_priv *priv = dev_get_drvdata(&wdev->dev);
> > > > > +     struct backlight_device *proxy_target = priv->proxy_target;
> > > > > +
> > > > > +     if (proxy_target) {
> > > > > +             int level = scale_backlight_level(bd, proxy_target);
> > > > > +
> > > > > +             if (backlight_device_set_brightness(proxy_target, level))
> > > > > +                     pr_warn("Failed to relay backlight update to \"%s\"",
> > > > > +                             backlight_proxy_target);
> > > > > +     }
> > > > >
> > > > >       return wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_LEVEL,
> > > > >                                    WMI_BRIGHTNESS_MODE_SET,
> > > > > @@ -147,13 +239,78 @@ static const struct backlight_ops nvidia_wmi_ec_backlight_ops = {
> > > > >       .get_brightness = nvidia_wmi_ec_backlight_get_brightness,
> > > > >   };
> > > > >
> > > > > +static int nvidia_wmi_ec_backlight_pm_notifier(struct notifier_block *nb, unsigned long event, void *d)
> > > > > +{
> > > > > +
> > > > > +     /*
> > > > > +      * On some systems, the EC backlight level gets reset to 100% when
> > > > > +      * resuming from suspend, but the backlight device state still reflects
> > > > > +      * the pre-suspend value. Refresh the existing state to sync the EC's
> > > > > +      * state back up with the kernel's.
> > > > > +      */
> > > > > +     if (event == PM_POST_SUSPEND) {
> > > > > +             struct nvidia_wmi_ec_backlight_priv *p;
> > > > > +             int ret;
> > > > > +
> > > > > +             p = container_of(nb, struct nvidia_wmi_ec_backlight_priv, nb);
> > > > > +             ret = backlight_update_status(p->bl_dev);
> > > > > +
> > > > > +             if (ret)
> > > > > +                     pr_warn("failed to refresh backlight level: %d", ret);
> > > > > +
> > > > > +             return NOTIFY_OK;
> > > > > +     }
> > > > > +
> > > > > +     return NOTIFY_DONE;
> > > > > +}
> > > > > +
> > > > > +static void putdev(void *data)
> > > > > +{
> > > > > +     struct device *dev = data;
> > > > > +
> > > > > +     put_device(dev);
> > > > > +}
> > > > > +
> > > > >   static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ctx)
> > > > >   {
> > > > > +     struct backlight_device *bdev, *target = NULL;
> > > > > +     struct nvidia_wmi_ec_backlight_priv *priv;
> > > > >       struct backlight_properties props = {};
> > > > > -     struct backlight_device *bdev;
> > > > >       u32 source;
> > > > >       int ret;
> > > > >
> > > > > +     /*
> > > > > +      * Check quirks tables to see if this system needs any of the firmware
> > > > > +      * bug workarounds.
> > > > > +      */
> > > > > +     dmi_check_system(quirks_table);
> > > > > +
> > > > > +     if (backlight_proxy_target && backlight_proxy_target[0]) {
> > > > > +             static int num_reprobe_attempts;
> > > > > +
> > > > > +             target = backlight_device_get_by_name(backlight_proxy_target);
> > > > > +
> > > > > +             if (target) {
> > > > > +                     ret = devm_add_action_or_reset(&wdev->dev, putdev,
> > > > > +                                                    &target->dev);
> > > > > +                     if (ret)
> > > > > +                             return ret;
> > > > > +             } else {
> > > > > +                     /*
> > > > > +                      * The target backlight device might not be ready;
> > > > > +                      * try again and disable backlight proxying if it
> > > > > +                      * fails too many times.
> > > > > +                      */
> > > > > +                     if (num_reprobe_attempts < max_reprobe_attempts) {
> > > > > +                             num_reprobe_attempts++;
> > > > > +                             return -EPROBE_DEFER;
> > > > > +                     }
> > > > > +
> > > > > +                     pr_warn("Unable to acquire %s after %d attempts. Disabling backlight proxy.",
> > > > > +                             backlight_proxy_target, max_reprobe_attempts);
> > > > > +             }
> > > > > +     }
> > > > > +
> > > > >       ret = wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_SOURCE,
> > > > >                                  WMI_BRIGHTNESS_MODE_GET, &source);
> > > > >       if (ret)
> > > > > @@ -188,7 +345,41 @@ static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ct
> > > > >                                             &wdev->dev, wdev,
> > > > >                                             &nvidia_wmi_ec_backlight_ops,
> > > > >                                             &props);
> > > > > -     return PTR_ERR_OR_ZERO(bdev);
> > > > > +
> > > > > +     if (IS_ERR(bdev))
> > > > > +             return PTR_ERR(bdev);
> > > > > +
> > > > > +     priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> > > > > +     if (!priv)
> > > > > +             return -ENOMEM;
> > > > > +
> > > > > +     priv->bl_dev = bdev;
> > > > > +
> > > > > +     dev_set_drvdata(&wdev->dev, priv);
> > > > > +
> > > > > +     if (target) {
> > > > > +             int level = scale_backlight_level(target, bdev);
> > > > > +
> > > > > +             if (backlight_device_set_brightness(bdev, level))
> > > > > +                     pr_warn("Unable to import initial brightness level from %s.",
> > > > > +                             backlight_proxy_target);
> > > > > +             priv->proxy_target = target;
> > > > > +     }
> > > > > +
> > > > > +     if (restore_level_on_resume) {
> > > > > +             priv->nb.notifier_call = nvidia_wmi_ec_backlight_pm_notifier;
> > > > > +             register_pm_notifier(&priv->nb);
> > > > > +     }
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static void nvidia_wmi_ec_backlight_remove(struct wmi_device *wdev)
> > > > > +{
> > > > > +     struct nvidia_wmi_ec_backlight_priv *priv = dev_get_drvdata(&wdev->dev);
> > > > > +
> > > > > +     if (priv->nb.notifier_call)
> > > > > +             unregister_pm_notifier(&priv->nb);
> > > > >   }
> > > > >
> > > > >   #define WMI_BRIGHTNESS_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
> > > > > @@ -204,6 +395,7 @@ static struct wmi_driver nvidia_wmi_ec_backlight_driver = {
> > > > >               .name = "nvidia-wmi-ec-backlight",
> > > > >       },
> > > > >       .probe = nvidia_wmi_ec_backlight_probe,
> > > > > +     .remove = nvidia_wmi_ec_backlight_remove,
> > > > >       .id_table = nvidia_wmi_ec_backlight_id_table,
> > > > >   };
> > > > >   module_wmi_driver(nvidia_wmi_ec_backlight_driver);
