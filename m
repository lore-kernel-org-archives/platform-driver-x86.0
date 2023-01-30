Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB51DC636CD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 22:00:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjA3WAT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 17:00:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjA3WAS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 17:00:18 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A8883C2
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 14:00:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXhTNaO2gpvzn+Qyx9V0pf6NWmlXYpjgL64x6soJgAo9NFPg/nbNwj5ioopx1wAba6Zo3YIOHh5AQKpxwXh5a+aCbvwqjbPYCKGk/2N9ClR/+vTKXCk8w6OwJ/b/BuoSjxcuyNXDQsjtZUBZFbwaMdvStfjgpEz5IQbE7OuYWd+638idjlqOspLm+VgFcgXuZcqJ/cGoHjIG/P1xnb8r2UWPsxD6pNeJhHQNdPZF0kNLdEEqw9Qxn+DPh6DQKpcwCvU9NQSH08cTxhK97M77W9iqQusYsJKmdrDzjL/KsyzyMECbfhdOsVeWf+y77sUhNXAhn/nHVIbfiGr6MTR4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUXcr//A4CfS8TTR5ZWIciJCPTLNPQYxAZ6CHdmUZDo=;
 b=JOR/seyhXSBAYWGEphzQ2yagwi6OOqKT/Jrq0Yh3ohNWhIDgN0AT7xv1eVzBZfjTOoH7iNJx2TQN1KJ7LXixFzgrkEyLmgUVUHrtwiYTYzteAKjKwI0Eip9xbsjC/kZtT6BrkqkiuIQ4Dtu8eckUDaVXo7OJwb36sfO8u4ggJuSYIuoVDLeWiN9PW880UQuhee7DKjd1LEdp2oQWgMPt+D8a7bzd1TY6ZDDVke0YZhINL/12ldVVIdRGh/4iOBIh5b4ILvP6qNbIxy3W43AmA0eAih7GJgX1NCxGLckUN1LrQA0r1dUSQN2Q3vxEl9SFJ5AGt5YXzhwR4fXB+DjI1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUXcr//A4CfS8TTR5ZWIciJCPTLNPQYxAZ6CHdmUZDo=;
 b=eCbPbVAVHPcJXLCX20FhKTesjwQW/IYPGhM4/vgCMReiDat8YeKq+WfQAPFPGc7JBgs7yoIg6RGqzaGXswgQ40YP+1Ypqv39gYVcJHUUNSHB7+dUfCZYbNt9e+/bNt9fbEq5NWt/rMxL0WD5Km0IF8vgCvxTOjKBtu/PAEucQbrrSHBfkCuyjnXPjbABPrzleJtSFvXU/S0BMft5jthrjbpUhLc5p9jVT//nXdI+hPbouhDMbQq0asF/PyH62H1sqx8KYnbZX9XX9ru8fJSNK/BHJM6Tg/bz26I7L9axkHfl7ibkWvtZ49yFulCSCUrTkj9DHXmtZhMCGtWSj17iOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 DM6PR12MB4880.namprd12.prod.outlook.com (2603:10b6:5:1bc::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.36; Mon, 30 Jan 2023 22:00:13 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6e75:2e:a53d:a7a]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6e75:2e:a53d:a7a%6]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 22:00:13 +0000
Date:   Mon, 30 Jan 2023 16:00:10 -0600
From:   Daniel Dadap <ddadap@nvidia.com>
To:     Alexandru Dinu <alex.dinu07@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v2] nvidia-wmi-ec-backlight: Add workarounds for confused
 firmware
Message-ID: <Y9g96nNy5iJFBy0L@ddadap-lakeline.nvidia.com>
References: <0fbfd32e-904d-1e04-8508-e863c357a2ff@nvidia.com>
 <20220316203325.2242536-1-ddadap@nvidia.com>
 <26e0d196-5b2d-6bdc-8cbf-19c5bb9736e4@nvidia.com>
 <CAJOTRr6J7-E_dt+zbh6S=rg62PodsQBXYUFhxJOAqbj4w=ns=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJOTRr6J7-E_dt+zbh6S=rg62PodsQBXYUFhxJOAqbj4w=ns=w@mail.gmail.com>
X-ClientProxiedBy: SA9P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::10) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2763:EE_|DM6PR12MB4880:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a657d99-c00e-44d4-29fa-08db030d5d11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dyyQdcPE4eDf2j7mGL3AI/xfFreQ91lOyDNPT0SqOR4EHT/kUAW8x2+CYrz2IGiHRmq1umEUlfe8OrTFC7QybaM1i+KqG0DMuAfZveUogq4GtHPcPHmjI6+YHiCi9iAVIeDCD7lpPUf6Ua0SU+YcRxwAmT3cHl8/jUFiEtBnCnb6Jb7W4ISq/2yLCqS7R9E51SX4IAOWbno9YjV6cocjUo4OdbIvTBEtz60XnQwyBHq5/CMK2JQQSZKi6UUTc19eajL4RIMBYrv8aMi1O40BpqcIHnyC2RNHBeWPNQFspR3HFDRRgl2kJO4ikV/T/yQzSJnYGOlDKB21XEQKjqszKQKDDjSkv9GAn3bgZ/ds5BWK+mbn+/TNohHjerhg3lX7FsbUP9CDDZwHRSVp28/0cAZnpYHs9mEk6wQigv6B9Ns+lOTZUg8ThRWUNfQCbNWkmE2vb7wRENnEKZneo5fJcstG1YAAILJzuVzkfsJJt1ggL58BmeZRq5IHpZgmwscrjd1WVmHDOkaJD+X/+65hIojeYNKa9/i5KcQ9BjomDgTPYwZ47hwg/XaXsv2ortj5dfgVLtiWk/1TKr7lZ5lglLguqXrdhGxGXUcgv2RcVGWP3XJTHacUvIk1gsWHzuyvdsboHyvgINckizUfqEbl0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199018)(2906002)(316002)(186003)(30864003)(6512007)(5660300002)(53546011)(6506007)(54906003)(26005)(38100700002)(6486002)(86362001)(83380400001)(478600001)(4326008)(6916009)(66476007)(66556008)(8676002)(8936002)(66946007)(66574015)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0ZoRFNzb0hyNU9TZ0lDS1lXZ3RHc1JGU3ljMEFNLzl6M1B5azU1czRBYnJM?=
 =?utf-8?B?OG1QMFg5Nmg3aUJ3ZndYeWd6QTNZMXhPY2k3RW96VnR6cUFiY21hZm13VXFH?=
 =?utf-8?B?Vm1XWlMwcDRVdE9DMkczQkVEYVpMaG84QVdVbWV3czBOZ0pQM0NkWGVjNkdN?=
 =?utf-8?B?NEF5cWUvR1Eyb2NoMlRrLzZGMEdrMllyYk5Gd3hqZjdZbmpyMzBjMFMweXNs?=
 =?utf-8?B?Vzd3YTIyUndxTnZtbGw4M0VTdVhEYkd0TkJWZmF6dm9KMzlFTHJ3ZjFiNDJX?=
 =?utf-8?B?QzNZbnFHRlIwZWpvMW56a3BtZ0hUejJvQ2c1ZzIxOW90SzR2cTRnbm5odkZB?=
 =?utf-8?B?NWRkK1k3TkJJQ0VFVndlNXhFM2N0UWdmaTE4SVJKZW1JZjBWYzBjSCswUHBF?=
 =?utf-8?B?TWtLNGFzMUIwMmJjbnNIK0Rrb0hDYy9FcEFQVEt3OHBUNHRteUc4WkF1YU9r?=
 =?utf-8?B?T1JJMHdVMnNaZ2QyYzBvZEg1SXN0WU9aRTJBWGxsSW9BTTNYQlFxUFdUaXRs?=
 =?utf-8?B?ZFF4N0QwM1U4N29OYmV5aDdXYU93T2s2NG1HRDF0UXRnYVNvcythY1ZiMGZm?=
 =?utf-8?B?cExmcXUrOTdwSmg4QXVjaUhQOVA5RE90S1BibllZWVZnK3ZmR0x1Y0NWS3dx?=
 =?utf-8?B?akhvenErc0E1aFJFOWE3ZzJ2TkdWVUdRQzJ3VnpDSnRpUlRmMGxMVmdDYWpD?=
 =?utf-8?B?UTFWb3BtNEMvdXJHVzZ6MVJJMGk4U1dPUkFKL2M4NjViR255SnpCTzNZRFB4?=
 =?utf-8?B?R1puVzVTcklxSGlYRlYrN3dtaEkrSDB0bTZrTkJCbEh6bjVEbXpaQTJDcVJq?=
 =?utf-8?B?VUJycW4rakIvWVl3RVNXOHl2S0djQlU4c0J2bzl1NE9KakZpWFk5SlFOSlJ6?=
 =?utf-8?B?alp2T3FnejluZEZFRXdGOTBXb2I3RnZwVlpTVkNXN1k3REdWTjVROXFKL2lV?=
 =?utf-8?B?dmppbnZXSGVVcTYrN3RNUWNWUDB0ZlJlc28wVGljWldYeEJUWDFkQjBoeHZl?=
 =?utf-8?B?c3dWbGgvL2dDOE9iSDJpS1hBZ0NuVm5DVzRDUVBKQzJFVm8xL0ZmbnNoUWdM?=
 =?utf-8?B?VmxJM003SXU0YmtDeHl6S2FNUVpBazNESzhlV1QyaGRFa3I3anIwaXVVYWxx?=
 =?utf-8?B?ZTBSUjI0S085dDJPRXVNWS9WNTduaGhncVpqSUwwZ0EyNDFxc1NlcU5zYnBG?=
 =?utf-8?B?K3VDb3ZNcGh5elBPVEk5anVKZXhhakFabGdIV2VxRlBRVEMwYmNFUTViOVZE?=
 =?utf-8?B?a2dEYTI1L3BHZlQrS1VYeTV1OWRqT0JZMDhSUllRUERBbGJ1S2hFK2VGS2NC?=
 =?utf-8?B?S05HNlFiZmhGWTFUN0t0OThNNyt5N1BITkVIcEMrZFlzWUlKL2g4ZnRUL3BX?=
 =?utf-8?B?REFJYXNPSFVIeEx5ZGJPM3JmbVJGR0srM2lMZ3FQT0k3NTE5VWhZOThKek0w?=
 =?utf-8?B?Z1I1VURrRk1LNzhPbklmckNka0tmemptVlNJQ1pYZVF0QURrR2d6YWEyY1lK?=
 =?utf-8?B?VHJ3SENneUN3L1AwOEZZMGNac0xTMDJHUGR1ZlkrTTNaWk5HSFh1UHNxSWhr?=
 =?utf-8?B?SnRyNW40UC9aenRtQnNRTm1ITjdscHo1by94M1dYYWpBZHRETjgxZG1jc1A3?=
 =?utf-8?B?bjNyZkYwWHQ0V1hhNXZ5NCtPc0p5OWdROTgrbWZWK25saU5xa05uaWFFYjly?=
 =?utf-8?B?NForelMrVGVXRGR1Ry9WOGE3SlgwMEdkNEJOc1FhdUt5QytVVmxWdktENmgv?=
 =?utf-8?B?NW5VTE5XRnExc0VKU0pFU3ZEZmtDN2dyb0ZJOVhSZWpjbE9TZm1YZUoxMFRi?=
 =?utf-8?B?bGs0TWpBTDlUSUJ6aUh2Tzc0eUtoMFVmRFZyVTY1UjZ1YmNFSFVpMElkL2Ni?=
 =?utf-8?B?NGJHZjRjZms5VC9iRFlNQ0htWU5zVzFYcTFKem54am4zdzRJNVMyVUh0Q1VH?=
 =?utf-8?B?bWs3WVV3Ym9QMkpESGVyWTk0c3RaUjZzN1QzeStwbHhBTDFaSEtQWXQ0SGNQ?=
 =?utf-8?B?WDltWnFyQW51RExKM3k2RGNSVXEzeVFYL0hBbGViQUdjK21BaUNBdkdDL1Q3?=
 =?utf-8?B?VVowZjRWMkoweUdoSUNBQlZuQXVsOXlrT0hpWWRXNnppeG90Mmc2RFIwKzFt?=
 =?utf-8?Q?BiHikgj55g0EfL/FecTApUq/k?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a657d99-c00e-44d4-29fa-08db030d5d11
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 22:00:13.7983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9dbE/0yzNUcpqILjaXcahOrYMmu6gQaEKyA7GLK4k9UiyuOsGVMug8o4zarC5dLO2GOYueTR4UASn1iI7zKIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4880
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Alex,

On Thu, Mar 17, 2022 at 12:09:03AM +0200, Alexandru Dinu wrote:
> > Note: the Tested-by: line above applies to the previous version of this
> > patch; an explicit ACK from the tester is required for it to apply to
> > the current version.
> 
> I compiled and tested v2 on 5.16.14.
> Everything works as expected: brightness control & level restore work
> both on first boot and on subsequent sleep/resume cycles.

I ended up abandoning this workaround patch because it was incompatible
with Hans's plan to clean up the backlight subsystem. In the meantime,
somebody else reported a similar issue recently which appears to be
resolved by updating to the latest firmware version. Have you updated to
the most recent firmware, and if so, are you still seeing this issue?

> Regards,
> Alex
> 
> 
> 
> On Wed, 16 Mar 2022 at 23:28, Daniel Dadap <ddadap@nvidia.com> wrote:
> >
> > Sorry, just noticed a typo in a comment:
> >
> > /* This quirk is preset as of firmware revision HACN31WW */
> >
> > Obviously that is meant to read "present". I'll fix that with the next
> > round of changes, assuming there will be additional review feedback.
> >
> > On 3/16/22 15:33, Daniel Dadap wrote:
> > > Some notebook systems with EC-driven backlight control appear to have a
> > > firmware bug which causes the system to use GPU-driven backlight control
> > > upon a fresh boot, but then switches to EC-driven backlight control
> > > after completing a suspend/resume cycle. All the while, the firmware
> > > reports that the backlight is under EC control, regardless of what is
> > > actually controlling the backlight brightness.
> > >
> > > This leads to the following behavior:
> > >
> > > * nvidia-wmi-ec-backlight gets probed on a fresh boot, due to the
> > >    WMI-wrapped ACPI method erroneously reporting EC control.
> > > * nvidia-wmi-ec-backlight does not work until after a suspend/resume
> > >    cycle, due to the backlight control actually being GPU-driven.
> > > * GPU drivers also register their own backlight handlers: in the case
> > >    of the notebook system where this behavior has been observed, both
> > >    amdgpu and the NVIDIA proprietary driver register backlight handlers.
> > > * The GPU which has backlight control upon a fresh boot (amdgpu in the
> > >    case observed so far) can successfully control the backlight through
> > >    its backlight driver's sysfs interface, but stops working after the
> > >    first suspend/resume cycle.
> > > * nvidia-wmi-ec-backlight is unable to control the backlight upon a
> > >    fresh boot, but begins to work after the first suspend/resume cycle.
> > > * The GPU which does not have backlight control (NVIDIA in this case)
> > >    is not able to control the backlight at any point while the system
> > >    is in operation. On similar hybrid systems with an EC-controlled
> > >    backlight, and AMD/NVIDIA iGPU/dGPU, the NVIDIA proprietary driver
> > >    does not register its backlight handler. It has not been determined
> > >    whether the non-functional handler registered by the NVIDIA driver
> > >    is due to another firmware bug, or a bug in the NVIDIA driver.
> > >
> > > Since nvidia-wmi-ec-backlight registers as a BACKLIGHT_FIRMWARE type
> > > device, it takes precedence over the BACKLIGHT_RAW devices registered
> > > by the GPU drivers. This in turn leads to backlight control appearing
> > > to be non-functional until after completing a suspend/resume cycle.
> > > However, it is still possible to control the backlight through direct
> > > interaction with the working GPU driver's backlight sysfs interface.
> > >
> > > These systems also appear to have a second firmware bug which resets
> > > the EC's brightness level to 100% on resume, but leaves the state in
> > > the kernel at the pre-suspend level. This causes attempts to save
> > > and restore the backlight level across the suspend/resume cycle to
> > > fail, due to the level appearing not to change even though it did.
> > >
> > > In order to work around these issues, add a quirk table to detect
> > > systems that are known to show these behaviors. So far, there is
> > > only one known system that requires these workarounds, and both
> > > issues are present on that system, but the quirks are tracked
> > > separately to make it easier to add them to other systems which
> > > may exhibit one of the bugs, but not the other. The original systems
> > > that this driver was tested on during development do not exhibit
> > > either of these quirks.
> > >
> > > If a system with the "GPU driver has backlight control" quirk is
> > > detected, nvidia-wmi-ec-backlight will grab a reference to the working
> > > (when freshly booted) GPU backlight handler and relays any backlight
> > > brightness level change requests directed at the EC to also be applied
> > > to the GPU backlight interface. This leads to redundant updates
> > > directed at the GPU backlight driver after a suspend/resume cycle, but
> > > it does allow the EC backlight control to work when the system is
> > > freshly booted.
> > >
> > > If a system with the "backlight level reset to full on resume" quirk
> > > is detected, nvidia-wmi-ec-backlight will register a PM notifier to
> > > reset the backlight to the previous level upon resume.
> > >
> > > These workarounds are also plumbed through to kernel module parameters,
> > > to make it easier for users who suspect they may be affected by one or
> > > both of these bugs to test whether these workarounds are effective on
> > > their systems as well.
> > >
> > > Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> > > Tested-by: Alexandru Dinu <alex.dinu07@gmail.com>
> > > ---
> > > Note: the Tested-by: line above applies to the previous version of this
> > > patch; an explicit ACK from the tester is required for it to apply to
> > > the current version.
> > >
> > > v2:
> > >   * Add readable sysfs files for module params, use linear interpolation
> > >     from fixp-arith.h, fix return value of notifier callback, use devm_*()
> > >     for kzalloc and put_device. (Barnabás Pőcze <pobrn@protonmail.com>)
> > >   * Add comment to denote known firmware versions that exhibit the bugs.
> > >     (Mario Limonciello <Mario.Limonciello@amd.com>)
> > >   * Unify separate per-quirk tables. (Hans de Goede <hdegoede@redhat.com>)
> > >
> > >   .../platform/x86/nvidia-wmi-ec-backlight.c    | 196 +++++++++++++++++-
> > >   1 file changed, 194 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> > > index 61e37194df70..95e1ddf780fc 100644
> > > --- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> > > +++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> > > @@ -3,8 +3,12 @@
> > >    * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
> > >    */
> > >
> > > +#define pr_fmt(f) KBUILD_MODNAME ": " f "\n"
> > > +
> > >   #include <linux/acpi.h>
> > >   #include <linux/backlight.h>
> > > +#include <linux/dmi.h>
> > > +#include <linux/fixp-arith.h>
> > >   #include <linux/mod_devicetable.h>
> > >   #include <linux/module.h>
> > >   #include <linux/types.h>
> > > @@ -75,6 +79,73 @@ struct wmi_brightness_args {
> > >       u32 ignored[3];
> > >   };
> > >
> > > +/**
> > > + * struct nvidia_wmi_ec_backlight_priv - driver private data
> > > + * @bl_dev:       the associated backlight device
> > > + * @proxy_target: backlight device which receives relayed brightness changes
> > > + * @notifier:     notifier block for resume callback
> > > + */
> > > +struct nvidia_wmi_ec_backlight_priv {
> > > +     struct backlight_device *bl_dev;
> > > +     struct backlight_device *proxy_target;
> > > +     struct notifier_block nb;
> > > +};
> > > +
> > > +static char *backlight_proxy_target;
> > > +module_param(backlight_proxy_target, charp, 0444);
> > > +MODULE_PARM_DESC(backlight_proxy_target, "Relay brightness change requests to the named backlight driver, on systems which erroneously report EC backlight control.");
> > > +
> > > +static int max_reprobe_attempts = 128;
> > > +module_param(max_reprobe_attempts, int, 0444);
> > > +MODULE_PARM_DESC(max_reprobe_attempts, "Limit of reprobe attempts when relaying brightness change requests.");
> > > +
> > > +static bool restore_level_on_resume;
> > > +module_param(restore_level_on_resume, bool, 0444);
> > > +MODULE_PARM_DESC(restore_level_on_resume, "Restore the backlight level when resuming from suspend, on systems which reset the EC's backlight level on resume.");
> > > +
> > > +/* Bit field values for quirks table */
> > > +
> > > +#define NVIDIA_WMI_EC_BACKLIGHT_QUIRK_RESTORE_LEVEL_ON_RESUME   BIT(0)
> > > +
> > > +/* bits 1-7: reserved for future quirks; bits 8+: proxy target device names */
> > > +
> > > +#define NVIDIA_WMI_EC_BACKLIGHT_QUIRK_PROXY_TO_AMDGPU_BL1       BIT(8)
> > > +
> > > +#define QUIRK(name) NVIDIA_WMI_EC_BACKLIGHT_QUIRK_##name
> > > +#define HAS_QUIRK(data, name) (((long) data) & QUIRK(name))
> > > +
> > > +static int assign_quirks(const struct dmi_system_id *id)
> > > +{
> > > +     if (HAS_QUIRK(id->driver_data, RESTORE_LEVEL_ON_RESUME))
> > > +             restore_level_on_resume = 1;
> > > +
> > > +     /* If the module parameter is set, override the quirks table */
> > > +     if (!backlight_proxy_target) {
> > > +             if (HAS_QUIRK(id->driver_data, PROXY_TO_AMDGPU_BL1))
> > > +                     backlight_proxy_target = "amdgpu_bl1";
> > > +     }
> > > +
> > > +     return true;
> > > +}
> > > +
> > > +#define QUIRK_ENTRY(vendor, product, quirks) {          \
> > > +     .callback = assign_quirks,                      \
> > > +     .matches = {                                    \
> > > +             DMI_MATCH(DMI_SYS_VENDOR, vendor),      \
> > > +             DMI_MATCH(DMI_PRODUCT_VERSION, product) \
> > > +     },                                              \
> > > +     .driver_data = (void *)(quirks)                 \
> > > +}
> > > +
> > > +static const struct dmi_system_id quirks_table[] = {
> > > +     QUIRK_ENTRY(
> > > +             /* This quirk is preset as of firmware revision HACN31WW */
> > > +             "LENOVO", "Legion S7 15ACH6",
> > > +             QUIRK(RESTORE_LEVEL_ON_RESUME) | QUIRK(PROXY_TO_AMDGPU_BL1)
> > > +     ),
> > > +     { }
> > > +};
> > > +
> > >   /**
> > >    * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
> > >    * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS_GUID
> > > @@ -119,9 +190,30 @@ static int wmi_brightness_notify(struct wmi_device *w, enum wmi_brightness_metho
> > >       return 0;
> > >   }
> > >
> > > +/* Scale the current brightness level of 'from' to the range of 'to'. */
> > > +static int scale_backlight_level(const struct backlight_device *from,
> > > +                              const struct backlight_device *to)
> > > +{
> > > +     int from_max = from->props.max_brightness;
> > > +     int from_level = from->props.brightness;
> > > +     int to_max = to->props.max_brightness;
> > > +
> > > +     return fixp_linear_interpolate(0, 0, from_max, to_max, from_level);
> > > +}
> > > +
> > >   static int nvidia_wmi_ec_backlight_update_status(struct backlight_device *bd)
> > >   {
> > >       struct wmi_device *wdev = bl_get_data(bd);
> > > +     struct nvidia_wmi_ec_backlight_priv *priv = dev_get_drvdata(&wdev->dev);
> > > +     struct backlight_device *proxy_target = priv->proxy_target;
> > > +
> > > +     if (proxy_target) {
> > > +             int level = scale_backlight_level(bd, proxy_target);
> > > +
> > > +             if (backlight_device_set_brightness(proxy_target, level))
> > > +                     pr_warn("Failed to relay backlight update to \"%s\"",
> > > +                             backlight_proxy_target);
> > > +     }
> > >
> > >       return wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_LEVEL,
> > >                                    WMI_BRIGHTNESS_MODE_SET,
> > > @@ -147,13 +239,78 @@ static const struct backlight_ops nvidia_wmi_ec_backlight_ops = {
> > >       .get_brightness = nvidia_wmi_ec_backlight_get_brightness,
> > >   };
> > >
> > > +static int nvidia_wmi_ec_backlight_pm_notifier(struct notifier_block *nb, unsigned long event, void *d)
> > > +{
> > > +
> > > +     /*
> > > +      * On some systems, the EC backlight level gets reset to 100% when
> > > +      * resuming from suspend, but the backlight device state still reflects
> > > +      * the pre-suspend value. Refresh the existing state to sync the EC's
> > > +      * state back up with the kernel's.
> > > +      */
> > > +     if (event == PM_POST_SUSPEND) {
> > > +             struct nvidia_wmi_ec_backlight_priv *p;
> > > +             int ret;
> > > +
> > > +             p = container_of(nb, struct nvidia_wmi_ec_backlight_priv, nb);
> > > +             ret = backlight_update_status(p->bl_dev);
> > > +
> > > +             if (ret)
> > > +                     pr_warn("failed to refresh backlight level: %d", ret);
> > > +
> > > +             return NOTIFY_OK;
> > > +     }
> > > +
> > > +     return NOTIFY_DONE;
> > > +}
> > > +
> > > +static void putdev(void *data)
> > > +{
> > > +     struct device *dev = data;
> > > +
> > > +     put_device(dev);
> > > +}
> > > +
> > >   static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ctx)
> > >   {
> > > +     struct backlight_device *bdev, *target = NULL;
> > > +     struct nvidia_wmi_ec_backlight_priv *priv;
> > >       struct backlight_properties props = {};
> > > -     struct backlight_device *bdev;
> > >       u32 source;
> > >       int ret;
> > >
> > > +     /*
> > > +      * Check quirks tables to see if this system needs any of the firmware
> > > +      * bug workarounds.
> > > +      */
> > > +     dmi_check_system(quirks_table);
> > > +
> > > +     if (backlight_proxy_target && backlight_proxy_target[0]) {
> > > +             static int num_reprobe_attempts;
> > > +
> > > +             target = backlight_device_get_by_name(backlight_proxy_target);
> > > +
> > > +             if (target) {
> > > +                     ret = devm_add_action_or_reset(&wdev->dev, putdev,
> > > +                                                    &target->dev);
> > > +                     if (ret)
> > > +                             return ret;
> > > +             } else {
> > > +                     /*
> > > +                      * The target backlight device might not be ready;
> > > +                      * try again and disable backlight proxying if it
> > > +                      * fails too many times.
> > > +                      */
> > > +                     if (num_reprobe_attempts < max_reprobe_attempts) {
> > > +                             num_reprobe_attempts++;
> > > +                             return -EPROBE_DEFER;
> > > +                     }
> > > +
> > > +                     pr_warn("Unable to acquire %s after %d attempts. Disabling backlight proxy.",
> > > +                             backlight_proxy_target, max_reprobe_attempts);
> > > +             }
> > > +     }
> > > +
> > >       ret = wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_SOURCE,
> > >                                  WMI_BRIGHTNESS_MODE_GET, &source);
> > >       if (ret)
> > > @@ -188,7 +345,41 @@ static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ct
> > >                                             &wdev->dev, wdev,
> > >                                             &nvidia_wmi_ec_backlight_ops,
> > >                                             &props);
> > > -     return PTR_ERR_OR_ZERO(bdev);
> > > +
> > > +     if (IS_ERR(bdev))
> > > +             return PTR_ERR(bdev);
> > > +
> > > +     priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> > > +     if (!priv)
> > > +             return -ENOMEM;
> > > +
> > > +     priv->bl_dev = bdev;
> > > +
> > > +     dev_set_drvdata(&wdev->dev, priv);
> > > +
> > > +     if (target) {
> > > +             int level = scale_backlight_level(target, bdev);
> > > +
> > > +             if (backlight_device_set_brightness(bdev, level))
> > > +                     pr_warn("Unable to import initial brightness level from %s.",
> > > +                             backlight_proxy_target);
> > > +             priv->proxy_target = target;
> > > +     }
> > > +
> > > +     if (restore_level_on_resume) {
> > > +             priv->nb.notifier_call = nvidia_wmi_ec_backlight_pm_notifier;
> > > +             register_pm_notifier(&priv->nb);
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void nvidia_wmi_ec_backlight_remove(struct wmi_device *wdev)
> > > +{
> > > +     struct nvidia_wmi_ec_backlight_priv *priv = dev_get_drvdata(&wdev->dev);
> > > +
> > > +     if (priv->nb.notifier_call)
> > > +             unregister_pm_notifier(&priv->nb);
> > >   }
> > >
> > >   #define WMI_BRIGHTNESS_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
> > > @@ -204,6 +395,7 @@ static struct wmi_driver nvidia_wmi_ec_backlight_driver = {
> > >               .name = "nvidia-wmi-ec-backlight",
> > >       },
> > >       .probe = nvidia_wmi_ec_backlight_probe,
> > > +     .remove = nvidia_wmi_ec_backlight_remove,
> > >       .id_table = nvidia_wmi_ec_backlight_id_table,
> > >   };
> > >   module_wmi_driver(nvidia_wmi_ec_backlight_driver);
