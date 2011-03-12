From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [ANNOUNCE] cpupowerutils - cpufrequtils extended with quite some features
Date: Sat, 12 Mar 2011 10:59:10 +0100
Message-ID: <AANLkTinErtKD_eufvhOL-1OOffYSouf5KLLH2cCMyaT3@mail.gmail.com>
References: <201103111247.00212.trenn@suse.de>
	<AANLkTimFg+uYGbSi=Ci-+_e89TgLkyMB7PAJcnt7mzTc@mail.gmail.com>
	<201103120053.53565.trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:43242 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753144Ab1CLJ7M (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 12 Mar 2011 04:59:12 -0500
In-Reply-To: <201103120053.53565.trenn@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thomas Renninger <trenn@suse.de>
Cc: linux-pm@lists.linux-foundation.org, discuss@lesswatts.org, cpufreq@vger.kernel.org, platform-driver-x86@vger.kernel.org

>> Hi Thomas,
>> Do you think handling really vendor specific "boosts" like EeePC's SHE
>> is in cpupower scope
> This is an oem/vendor specific way to modify the front-side-bus
> throughput on (Intel atom only?) eeepc like machines (acer, asus and
> others?)?

I don't know exactly what it does, but yes it seems to modify the fsb
(and possibly something else on some models, who know ...), and it's
only specific to Asus EeePCs.
But Asus notebooks seems to have a similar "Power4Gear" function, that
may also overclock/downclock the gpu.

> You could try to experiment with registering your own delayed work queue
> in eeepc-laptopc.c and try to find best tunings and fittings for such
> requirements.
> If it works out and/or other xy-laptop.c or whatever drivers provide
> similar functionality it could get moved up into a more generic
> framework. A separate one next to cpuidle and cpufreq, for example
> fsb_mod?

I'll see if other platform drivers have something similar, but I
believe that at least one of them has a "peformance" mode.

> PS: Wouldn't the cpufreq subsystem suffice to register for this
> SHE thing?
> Could it be that SHE and real CPU freq (speedstep) is mutual exclusive?
> Is the only problem that p4_clockmod cannot be loaded then?

p4_clockmod is only loaded on olds EeePCs. New ones are using
acpi-cpufreq. And you can only load one cpufreq driver at a time.


-- 
Corentin Chary
http://xf.iksaif.net
