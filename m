Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC1C30F55F;
	Mon, 15 Jun 2026 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781530276; cv=none; b=F3l1j/sWoywNwE7s3z9jiDUTKXswrdMgGAzrRjhTixdGq8bmIsJsr+3eJmS5VbQRlnFmEldfxo9RctQFxcnXEnaTFW0mDSA5nu/Zq1cibGlUVmzSxfuCvVbSDWkOW5altkev+1Jsug9GUuKQ+wx8QnHaPmZ3BAQds2PvHaiMApk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781530276; c=relaxed/simple;
	bh=IXF7vNL1vTW9uGP8oOHAFFUC0Kra85o0HclEKF6qSYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQMcWzvwL+mfk6hqwKdq1RH3/SSzS5MFC2riPco8rGYn4mBmUuJ0DlmfLEAtuT+dlV20I6GCLrTXyhMOJnrcaB3qTkRAxUcFmXxFNh0Uh07gU4OoOaI6QGWrg/R2nqlH4ZIEU+/u2+FhrR1GDCjc//g505jQh6DdNPFH8H8eryE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rO1HhVwG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rO1HhVwG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3881F000E9;
	Mon, 15 Jun 2026 13:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781530274;
	bh=t1bKA+p85D9RUyb7920Bu7AtW1RZIwvgycs8/1ZNa8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rO1HhVwG3BXUHYjLr/5/NajRsPjWfXlmVsGGhi19pYlPFbCwCPT0e6acosnjr74LU
	 HwMG7g1aGzuOYxVw5V3FRkUnq8RYEl1XqeLhRFXuWwv6JpBCtGAInhxqov799OSrqC
	 7kbA8AcVsFqn45b3WkPbWGBLRbwskmiNSOg/e4pw=
Date: Mon, 15 Jun 2026 15:30:07 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Shuangpeng Bai <shuangpeng.kernel@gmail.com>, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [BUG] KASAN: slab-use-after-free in _copy_to_user from
 platform/x86/dell-smbios-wmi
Message-ID: <2026061525-dayroom-backspace-4273@gregkh>
References: <178144969601.60470.13396800403157907003@gmail.com>
 <543e7c0f-ae4b-49e4-8bdf-6bf7d0dc4775@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <543e7c0f-ae4b-49e4-8bdf-6bf7d0dc4775@gmx.de>

On Mon, Jun 15, 2026 at 02:19:16PM +0200, Armin Wolf wrote:
> Am 14.06.26 um 21:15 schrieb Shuangpeng Bai:
> 
> > Hi Kernel Maintainers,
> > 
> > I hit the following report while testing current upstream kernel:
> > 
> > KASAN: slab-use-after-free in _copy_to_user from platform/x86/dell-smbios-wmi
> > 
> > on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)
> > 
> > The reproducer and .config files are here.
> > https://gist.github.com/shuangpengbai/f5b15c099e80897486b4238ddb91df79
> > 
> > I'm happy to test debug patches or provide additional information.
> 
> It seems that unbinding the dell-smbios-wmi driver races with any outstanding
> file operations on the misc device, causing them to access memory already freed
> by the unbound driver.

How can that happen if the module reference count is properly
incremented when the file is open?  Perhaps the driver isn't doing that
correctly?

> I do not know if the misc device synchronizes file operations against removal,
> but i do not think that this is the case. I added the maintains of the char drivers
> to the discussion, maybe they know this.

Wait, is this a module unload, or a manual "unbind" operation from
sysfs?  Either way, this something that only root does, and is not part
of any normal operation that a user can trigger, or should ever be
doing, so it's kind of "best effort" if it works at all :)

thanks,

greg k-h
