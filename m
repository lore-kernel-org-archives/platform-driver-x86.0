Received: from smtp02.rackhost.hu (smtp02.rackhost.hu [91.227.138.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A300749620
	for <platform-driver-x86@vger.kernel.org>; Sat, 19 Sep 2026 14:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.227.138.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789828103; cv=none; b=B/MlHnWoCvJapr7GBIzFV+atXOQn2W1LyDL6GItWfH+P2ohHja69qOSGhThAsGyVqlVRhH4sHxZJJ8cM72DMUgkSFb+0RimmfhgwObDLer0pUpy6zi1cdk+k9VJG/a2VC+rWyi/k7/TKOOqXNeyFsAGd8yN1VlNqV671vmyS5as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789828103; c=relaxed/simple;
	bh=k/48q6qtlmrLj/brboJluwMERpywUvIs13+fAsO7i24=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=sMQu7xO8c7CbV//Wm9OmUa+rdQxLBFzTZzcP2aajDVR3s57xYMAq1CgkKIDvl4795KxDNzz2aQBbL2RVS2ZjCTUr1G/64qqtfs5pn349bMS2fZDczQijYmBybc7hvocSGNVWKAjZ40TuVwW0Kke22AfqoBicLHWAMoEuLGTAsXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ruszin.hu; spf=pass smtp.mailfrom=ruszin.hu; dkim=pass (2048-bit key) header.d=ruszin.hu header.i=@ruszin.hu header.b=p8L6d7da; arc=none smtp.client-ip=91.227.138.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ruszin.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ruszin.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ruszin.hu header.i=@ruszin.hu header.b="p8L6d7da"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ruszin.hu;
	s=smtp0220241218; t=1789828098;
	bh=k/48q6qtlmrLj/brboJluwMERpywUvIs13+fAsO7i24=;
	h=Date:From:Subject:To:Cc:From;
	b=p8L6d7dayRaIQbHsM6NFxdtnOK1Z+jRf5LJWw1G4gAOZBIK+5Za1PINIllrTxR1eG
	 cY8LY57jvhQ211jQBYuPrVd210r5kkGisKQCikpW999w1+IvSZEIHIo6urt2yQvQdc
	 CjfBC14FbQAV9r9XG2Nn/PTxlpPdTUxJjhR/XiT13Rc2KI3bkHH5rNKQCyH6KaBmzw
	 I8gaTZFKQjruw5S3doTMOocpQteSWCyu5+Tt/gWnAF654XWZhBCSKZbeit9wstG9As
	 lz48iF25zCuMlSHkzxt+Z414k5ChESmgv3vElPqZW6sYea6qKkIM/h1AXCrEIJtIBG
	 zsbfNFc5e7BJQ==
Received: from [192.168.31.165] (h52-147.pool185-195.dyn.tolna.net [185.195.52.147])
	by smtp02.rackhost.hu (Postfix) with ESMTPSA id 8D9BE205BF;
	Sat, 19 Sep 2026 16:28:17 +0200 (CEST)
Message-ID: <b2f0f997-5bba-4f4a-b8f3-756bee317a52@ruszin.hu>
Date: Sat, 19 Sep 2026 16:28:16 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Ruszin <daniel@ruszin.hu>
Subject: ThinkPad T14 Gen 6 AMD: large Linux/Windows idle-power difference
 (AMD drm/amd#5863)
To: mpearson-lenovo@squebb.ca
Cc: platform-driver-x86@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mark,

I hope you don't mind me contacting you directly about this.

I have been investigating a fairly large and very reproducible 
Linux/Windows power-consumption difference on my ThinkPad T14 Gen 6 AMD 
(21QJ0057HV, Ryzen AI 7 PRO 350 / Krackan Point).

Machine details:

   ThinkPad T14 Gen 6 AMD
   MTM:       21QJ0057HV
   S/N:       PF64GG3L
   Support:   Lenovo Premier Support, active

   BIOS:      R2XET40W 1.20
   EC:        1.12
   AGESA:     StrixKrackanPI-FP8 1.1.0.0f
   Panel:     LEN403A / DBEF5, 1920x1200 @ 60 Hz


I have now opened a detailed AMD report here: 
https://gitlab.freedesktop.org/drm/amd/-/issues/5863

The important point is that this did not start with my experimental 
kernel. I originally noticed the problem with normal distribution 
kernels, and I have also reproduced the poor Linux power behaviour with 
the Ubuntu 24.04 OEM kernel. The custom AMD staging kernels came later, 
only because I wanted to understand what the hardware was actually doing.

The controlled measurements currently look roughly like this:

     Screen on / idle
       Linux, clean multi-user.target:          ~7.57 W
       Windows, normal desktop:                 ~5.60–5.78 W

     Internal display off
       Linux, panel verified powered off:       ~5.27–5.45 W
       Windows, after natural screen-off:       ~2.25–2.29 W

On Linux I can now verify through AMD DC/DMCUB diagnostics that the 
display really is down: zero DRM streams, inactive eDP link, backlight 
off, panel power off, all HUBPs power-gated, and actual IPS1/IPS2 
entries. Despite that, the machine still remains around 5.3–5.5 W.

I have already found one Linux-side DCN35 zero-stream policy issue 
during the investigation, but correcting that only improves APU power by 
roughly 0.1–0.2 W, so it does not explain the main difference.

I am trying to be careful with the Windows result because this is a 
Modern Standby system. The measurement process remained runnable with 
SYSTEM_REQUIRED and EXECUTION_REQUIRED requests, but Windows may still 
be reaching deeper runtime residency between samples. I am therefore not 
claiming that the two operating systems are necessarily sitting in an 
identical internal state.

One reason I am hesitant to regard this simply as an unavoidable Krackan 
power floor is that I have found reports from other Linux users with 
very similar hardware doing considerably better. A ThinkPad T14s Gen 6 
AMD owner with a Ryzen AI 7 350 / Radeon 860M reported around 2.1 W idle 
with the stock TuneD profiles and around 1.5 W after further tuning. I 
also found a Framework 13 owner with the Ryzen AI 7 350 reporting 
roughly 10–12 hours of Linux battery life. These are obviously anecdotal 
reports from different configurations, not controlled evidence, but they 
suggest the platform can be substantially more efficient under Linux.

For practical context, my normal workload is software development and 
cybersecurity work: VSCodium, Signal/Discord, Spotify, a browser with 
several tabs, SSH terminals, and usually an RDP session. Linux is 
typically around 10–11 W in that workload, while Windows is closer to ~7 
W. That translates into a very noticeable battery-life difference.

At this point I am not assuming this is a Lenovo firmware bug. It could 
still be somewhere in AMD's Linux stack or firmware-controlled power 
management.

What I am wondering is whether Lenovo knows of any platform-specific 
difference on this generation involving ACPI, WMI, EC policy, 
LPS0/Modern Standby coordination, or some BIOS/firmware initialization 
that the Windows stack performs and Linux currently does not.

The machine currently has:

     BIOS:   R2XET40W 1.20
     EC:     1.12
     AGESA:  StrixKrackanPI-FP8 1.1.0.0f
     Panel:  LEN403A / DBEF5, 1920x1200 60 Hz

If Lenovo has internal Linux/Windows power measurements for this 
generation, a newer BIOS/EC build worth testing, or any ACPI/platform 
diagnostic that could help distinguish the remaining ~3 W difference, I 
would be very interested.

I have the machine available and can test kernels, firmware builds, ACPI 
traces, or other diagnostics quickly.

The AMD GitLab issue contains the detailed measurements and the kernel 
investigation so far, so I did not want to duplicate all of it here.

Thanks very much for any pointers you can provide. I really like this 
machine and would love to get its Linux power consumption closer to what 
the hardware seems capable of.

Regards,

-- 
_____________________________________
Daniel Ruszin
Software Engineer | Cybersecurity | Accountant

Mobile:    +36 20 249-2996   (+Viber, Signal, Telegram, etc.)
E-mail:    daniel@ruszin.hu

