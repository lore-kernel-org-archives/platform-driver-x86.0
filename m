Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061981C2BD;
	Fri, 27 Dec 2024 18:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735325329; cv=none; b=UpVOj2wP6/GQjWRS6SmCb5xZ4EhvLbApEfIQ51h0lbSknQ+hkbu0j9nmoOuM29UKAJVFHuGh0v+u60o8k5l+5Vi/VyUZT8lsJu2jljHjIXAczMIbd3gWOR3OtXO1pEkRL7tGQkItzrv5K+VdJo6wu2T/kx+amH37tVH7QTceJxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735325329; c=relaxed/simple;
	bh=de9YawzoPkw5LfFG4GZ3/VeW61mm9EPQ5iS35qjq/U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1ygPUj4gc8fnixjB4V5r9rbYci3LRmNLyQ4QYlNJofzUbAzSCwEjKwKNJddDlfnfXn8+YA5XSBmEy7oz8LTf6Akb/l73URZ2/+lTekK7LjglNCTVBzqdqW26ZHqtGgzsax1BdOLIGWSPQc8KwyX0+yZ38FCD3hUM4l4fiIM5aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=5gsljBUk; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="5gsljBUk"
Received: from localhost.localdomain (unknown [IPv6:2a02:2149:8b14:7c00:7f68:a54:8871:387f])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 939A62E00777;
	Fri, 27 Dec 2024 20:48:34 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1735325316;
	bh=KaXqSLciCpR5aZlcxzNkJJ31s1Cmt2fdD+pblQ/1Fnc=; h=From:To:Subject;
	b=5gsljBUk0uGY4QhNQ8lMp574G5ateaOsKE8YFggEhIw6nYlQguMt93bedcs8wRiKL
	 LxW83TsKPRIb2jzKO9dFvs+QqaKeYA5LSR5dLvum7rni7NRvYBYi2kXQUova8uvZ36
	 mNbKdKYuUyyOnJ1xRhGodlea0yUOYcvzYaxUp9wM=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a02:2149:8b14:7c00:7f68:a54:8871:387f) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: derekjohn.clark@gmail.com
Cc: corbet@lwn.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	mpearson-lenovo@squebb.ca,
	nijs1@lenovo.com,
	pgriffais@valvesoftware.com,
	platform-driver-x86@vger.kernel.org,
	shaohz1@lenovo.com,
	superm1@kernel.org,
	zhangzx36@lenovo.com,
	johnfanv2@gmail.com,
	codyit@gmail.com,
	W_Armin@gmx.de
Subject: Re: [PATCH 0/1] platform/x86: Add Lenovo Legion WMI Drivers
Date: Fri, 27 Dec 2024 19:48:25 +0100
Message-ID: <20241227184825.415286-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241217230645.15027-2-derekjohn.clark@gmail.com>
References: <20241217230645.15027-2-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <173532531561.9273.10613731026644363289@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Hi Derek,

Good job on the driver. I spent a bit of time reviewing it today, and I
have a few thoughts. Hopefully you can go through them fast, and we can
have a solid base of understanding moving forward so that I can e.g.,
merge your driver on Bazzite ahead of the kernel, so you can get some
valuable testing.

// Firmware Attributes
Right now, I have one major concern I'd like to be addressed before
moving into the details of the driver. This is mirrored in the Asus
driver you referenced [1] as well and I do not think I have seen solid
argumentation for it yet.

Essentially, you are using the firmware attributes interface for the
ephemeral attributes SPL, SPPT, and FPPT which is also a concern mirrored
in the thread with Armin (+cc) and John (+cc) [2]. The question here
becomes, if exposing fan curve attributes via the firmware interface is
fickle, why is it correct for SPL, SPPT, and FPPT?

For context, when it comes to Asus (see [1]), these tunables reset during
reboots, after sleep, and when changing the TDP mode. Specifically, TDP
mode, SPL, SPPT, and FPPT, and the fan curve are not preserved between
reboots, with only TDP mode being preserved between sleep. Following, 
setting TDP mode resets SPL, SPP, and FPPT, and setting any one of those
resets the fan curve.

For Lenovo and the Legion Go (1st Gen) it actually depends on the BIOS
version. In early BIOSes, the custom tunings used to be preserved until
you reset the BIOS. However, I suspect that this caused used confusion, as
if you uninstalled Legion Space, the tunings to custom mode would still be
applied which would be unintuitive. In new BIOS versions, the tunings reset
when changing TDP modes, which can be done with the combination Legion
L + Y. I am unsure if they are still preserved between reboots if you
remain in custom mode. Fan curve resets as well. But the point is that they
are not persisted, at least to the extent expected by the firmware
attributes class and writing to them in other modes is undefined.

Lastly, if another driver were to be developed e.g., for AMD out-of-tree
to control devices without a vendor interface, we'd have the same
issue. As this driver or [1] merging would set a precedent for using
firmware attributes for these tunings, I think it is important to reach
agreement before moving forward. For AMD w/o vendor, more details can
be found in [3]. In [3], Mario makes an RFC for an alt interface for SPL,
SPPT, and FPPT, through amd_pmf which does not have this peculiar issue.

There are settings where it does make sense however, such as VRAM, boot
sound (Asus), and the suspend light/barrel plug RGB (Legion). These
settings are typically persisted in BIOS and there is no ambiguity for
fitness in those.

// Driver Details
Ok, as for the rest of the driver, I have (i) some stylistic comments and
(ii) will mirror similar concerns to John in unnecessary accesses.

(i) Stylistic Comments
I would personally be a fan of adding WMI support to the kernel, such that
userspace can access WMI attributes without the use of a driver, as it is
done in Windows. However, as I have discussed with Mario, such a thing is
not an easy task, as it would require adding a BMOF parser to the kernel
which is a monumental effort. In any case, the current kernel requires
us custom write drivers for the WMI interface.

The reason for this preface is that I think that your driver style is a bit
"too close" to what such a thing would look. E.g., in the driver I can see
snippets such as `LENOVO_CAPABILITY_DATA_01 WMI data block driver.` and
`MODULE_IMPORT_NS("CAPDATA_WMI");`. Since you are going through the effort
of writing a custom driver, I would be more opinionated in how I'd design
the driver, so that it's more intuitive from a user's perspective. I think
John's driver (which has its own issues) and the asus-wmi drivers strike a
bit better balance, where they "translate" the WMI calls into an ABI that
can be documented and then parsed by a developer.

Such a design process would then also allow to claim the name legion, as
you could make sure the legion driver only loads on Legion laptops, where
now it would randomly load in other laptops as well. Sidenote here is
that this is something I also found confusing, as the Legion Go does not
have a keyboard so that driver should definitely not load.
E.g., you could only load when you detect the Gamezone interface and then
access the other two as well. The Gamezone interface is only used in
Legion laptops AFAIK. I think Lenovo also kind of implements all three
as stubs even if some are not used, to allow extending them with BIOS
updates, so blindly loading drivers based on the interface might not be
the best idea in any case. When the Legion Go released, I think only one
of the three interfaces was used, for example, but all three were present.

(ii) Unnecessary Accesses
Even though you went hands off on your design of the driver, at the same
time you held back when it comes to userspace accesses by globally forcing
the Other function hints as limits. This creates two issues.

The first one is that those limits might be wrong for certain devices or
certain users might want to go a bit above them, which would mean that if
you enforce them you'd need to provide a way to quirk them and a module
parameter override (I know they are correct for the Legion Go as I have
looked through them as well). But if it is not necessary in Windows,
why would we add additional roadblocks in the kernel? If Lenovo feels the
need to enforce them, they can do so in their firmware and extend that
protection to Windows as well. Asus does when it comes to their fan curve
firmware, for example.

The second is that you are making a lot of necessary calls, which may harm
performance or potentially cause instability. My workflow for setting TDP
on the Go is that I first respect the TDP mode the user has set using
Legion L + Y. If the user wants to change that, then I do the following:
set TDP mode to custom, set the TDP, set the SPL, SPPT, and FPPT, and then
set the fan curve. I also add a small delay in-between each of these calls
as a further precaution. In your current driver, each of these calls would
make two additional calls to the WMI interface (one for the limits and
one for the TDP mode), which would more than double the number of calls
made in a typical scenario (from 5 to 12), where each triplet is made
back to back.

There is also the issue mentioned by John, where you do cross-interface
interactions etc. To fix this, you'd have to retrieve the limits from
firmware on probing and then cache them in the driver after quirking. It
would be much easier just to skip all of this for now and just use them to
prepopulate _min and _max values as hints instead, which you already do.

Those were my comments. You mentioned that you are travelling and might not
have access to your PC so take your time with the replies.

Happy holidays,
Antheas

[1] https://lore.kernel.org/all/20240930000046.51388-1-luke@ljones.dev/
[2] https://lore.kernel.org/lkml/eb165321-6a52-4464-bb58-11d8f9ff2008@gmx.de/
[3] https://lore.kernel.org/lkml/20240926025955.1728766-1-superm1@kernel.org/
