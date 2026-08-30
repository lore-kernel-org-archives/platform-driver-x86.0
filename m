Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EB4231829;
	Sun, 30 Aug 2026 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788079354; cv=none; b=tUuCVPtc1JCJesPwC/tXk4RqZfNCmIMUmENHnWgW5rgJcc71/j5CVtTuLUYDM6yrOCiWZJMvNIJEqXYnhOhpulCee4sv9f0UcqGT3nVhWtdhVHZkpj7MrifD9WzvkMDY+W8h6PPQVsZjrOsB9IVSUE/sYSfRuFPgE2ATvD88CYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788079354; c=relaxed/simple;
	bh=+UeM+alq9EDTJh0ZtDrwamiiPK10SVhTO+d3Y2PcxkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0TAkBAYkol/NZOX6Y/BcWrGeYnc+rioQ3i0ZJeh5ZgszzlnFQDPJQkLNVcbTjtHOHObU0BiHYYCQ6VkNjGKrz6f0lbfGTgjumIwsMmSJ1d39sR1QtnE9GipsAPmdnifP71AhnG0Oykb0wRXd0EWI8YxcknwM7xgGfGTGWe1po0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=cspiEtXF; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="cspiEtXF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=116nWdpKFPlKWNq/XN21H1dzMa/wc66T/tPzE5PPjMM=; b=cspiEtXFh62uGQCKCGEGINUs0g
	GobGavxDaXDkfNdGreKoujdarEX6ducu0/Hel/r2o8pK7rLFyaR6oC/nTTuC/2sIQOKd3SJ9lhZ+7
	hZ8GpfyFnMNwOJA4D2U/qLW0uWxxWgK9qA8e/tCxP8As4ikOc4iaW4xLH93Gvq4P6aFvdAM6ZrmqN
	1tUQ0AB0WQra6M6nGi6PAe3QJzLC0+3UHDcByOZ9h6rS4+Fu031EuV/XEvcnjIUlnh7o1yVM1FCnm
	oZ5Xk4aFfkI6u2fk2V1sNztLAU0zFDLOgdncyCI/MkDrd1rMD1S7R2q9FEN5tGrk1kd+mCh+toK1b
	at++zPNA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <carnil@debian.org>)
	id 1x0b7D-000cJM-2x;
	Sun, 30 Aug 2026 08:42:12 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id 38772BE2DE0; Sun, 30 Aug 2026 10:42:08 +0200 (CEST)
Date: Sun, 30 Aug 2026 10:42:08 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Jun MO <royclark086@gmail.com>, 1146124@bugs.debian.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Denis Benato <denis.benato@linux.dev>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: asus-laptop: Fn hotkeys no longer work on ThinkPad SL400 after
 378500dc1313 ("platform/x86: asus-laptop: Register ACPI notify handler
 directly")
Message-ID: <178807922598.807847.18300931641658404390@eldamar.lan>
References: <178806598504.23591.11490486941444891398.reportbug@localhost>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178806598504.23591.11490486941444891398.reportbug@localhost>
X-Debian-User: carnil

Control: forwarded -1 https://lore.kernel.org/regressions/178807922598.807847.18300931641658404390@eldamar.lan
Control: tags -1 + upstream

Hi

In Debian, in https://bugs.debian.org/1146124, Jun Mo, reported the
following, with a bisection result:

On Sun, Aug 30, 2026 at 12:59:45PM +0800, Jun MO wrote:
> Dear Maintainer,
> 
> Fn hotkeys on Lenovo ThinkPad SL400, which are supported by the
> module asus-laptop, no longer work starting from Linux 7.1. Normally
> when those keys/key combinations are pressed,
> acpi_listen/kacpimon/"evtest
> /dev/input/by-path/platform-asus_laptop-event" will capture related
> events, for example:
> 
> $ acpi_listen
> ^[[1;2Photkey ATK0101:00 00000032 00000000
> button/mute MUTE 00000080 00000000 K
> ^C
> 
> Starting from Linux 7.1, there are not any related event captured by those command.
> 
> Using snapshot.debian.org, I found out that the last working kernel version is 7.0.14-1 while the first not working version is 7.1~rc2-1~exp1.
> 
> Following instructions in [1] and using /boot/config-7.0.14+deb14-amd64, a bisect resulted in:
> 
> git bisect start
> # status: waiting for both 'good' and 'bad' commits
> # good: [458c6079fc1d41d564c37679c8ace02cd83ee817] Linux 7.0.14
> git bisect good 458c6079fc1d41d564c37679c8ace02cd83ee817
> # status: waiting for 'bad' commit, 1 'good' commit known
> # bad: [7fd2df204f342fc17d1a0bfcd474b24232fb0f32] Linux 7.1-rc2
> git bisect bad 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
> # good: [028ef9c96e96197026887c0f092424679298aae8] Linux 7.0
> git bisect good 028ef9c96e96197026887c0f092424679298aae8
> # good: [334fbe734e687404f346eba7d5d96ed2b44d35ab] Merge tag 'mm-stable-2026-04-13-21-45' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> git bisect good 334fbe734e687404f346eba7d5d96ed2b44d35ab
> # good: [cdd4dc3aebeab43a72ce0bc2b5bab6f0a80b97a5] Merge tag 'ntfs-for-7.1-rc1-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs
> git bisect good cdd4dc3aebeab43a72ce0bc2b5bab6f0a80b97a5
> # bad: [beaba8bfbb91e3bb3133eacacd62fd6fea515e34] Merge tag 'probes-v7.1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
> git bisect bad beaba8bfbb91e3bb3133eacacd62fd6fea515e34
> # good: [bea8d77e45a8b77f2beca1affc9aa7ed28f39b17] Merge tag 'staging-7.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
> git bisect good bea8d77e45a8b77f2beca1affc9aa7ed28f39b17
> # bad: [065c4e67cc2c40e6dd94649e8e720096fbabd4ee] Merge tag 'uml-for-7.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux
> git bisect bad 065c4e67cc2c40e6dd94649e8e720096fbabd4ee
> # good: [4b0b946019e7376752456380b67e54eea2f10a7c] Merge tag 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
> git bisect good 4b0b946019e7376752456380b67e54eea2f10a7c
> # bad: [d6116d86e58a04a9522e349c4a27145521c01ad7] platform/x86: int3472: Use local variable for LED struct access
> git bisect bad d6116d86e58a04a9522e349c4a27145521c01ad7
> # good: [19ebacfb442b83aa5fe75f9c6851b4edbfff3760] platform/x86: dell/dell-rbtn: Convert ACPI driver to a platform one
> git bisect good 19ebacfb442b83aa5fe75f9c6851b4edbfff3760
> # bad: [378500dc1313e2c06a2f675bb00ab5d7880433ba] platform/x86: asus-laptop: Register ACPI notify handler directly
> git bisect bad 378500dc1313e2c06a2f675bb00ab5d7880433ba
> # good: [03ae0a0d0973b9e584a05136aab08fee2ef8e455] platform/x86: uniwill-laptop: Implement USB-C power priority setting
> git bisect good 03ae0a0d0973b9e584a05136aab08fee2ef8e455
> # good: [b0bcf48c74cc7f72d1b6effc7cecdae871b1785e] platform/x86: toshiba_acpi: Register ACPI notify handler directly
> git bisect good b0bcf48c74cc7f72d1b6effc7cecdae871b1785e
> # good: [553b2ac59fbb434330287fde0cabc64bc6f11ceb] platform/x86: toshiba_bluetooth: Convert ACPI driver to a platform one
> git bisect good 553b2ac59fbb434330287fde0cabc64bc6f11ceb
> # good: [3a96c7915d93231e128df74901fe8fcb960b0ecb] platform/x86: toshiba_haps: Convert ACPI driver to a platform one
> git bisect good 3a96c7915d93231e128df74901fe8fcb960b0ecb
> # first 'bad' commit: [378500dc1313e2c06a2f675bb00ab5d7880433ba] platform/x86: asus-laptop: Register ACPI notify handler directly
> 
> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1143721#15

#regzbot introduced: 378500dc1313e2c06a2f675bb00ab5d7880433ba
#regzbot link: https://bugs.debian.org/1146124

Does this rings a bell?

Regards,
Salvatore
