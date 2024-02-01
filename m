Received: from a1i923.smtp2go.com (a1i923.smtp2go.com [43.228.187.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABB553374
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Feb 2024 14:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.228.187.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706796609; cv=none; b=uGw8PkgdU/x8wSQ4dR9wZWt/OHa4yYCEhR44r73jRj3+19YQ3tC61wE7gs0umVxTVkSvilTCHJiMgrDZvjRfkIXjhqXzHwVwBVX2MJYxy/GA3lo8MSPf6yH3iCXKnt7XOYPrHsA499CzvY/LKsWA5eYsIK1537T4PKvxcoC528Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706796609; c=relaxed/simple;
	bh=xvTqnuvRtRh7b4WcdYFzMm0DaaFoToWEx0oXGkqTF5s=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ippsUxSVe6lSRn3CVARQGdu49gVd+Nc5rHFteTkfI5dQV3kk1Cy5MXfV13ryeuqUiwZvX9fcIWjO+1BoUEbWkNhSQUarILqTSArSChWDiskLZETPEs7cupA1nos3aXz+ruUKVMVxS+W5CuTBqWFIgVuVp2BjSXVwBi/xRSkxaQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com; spf=pass smtp.mailfrom=return.smtpservice.net; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=vAmBMBUo; arc=none smtp.client-ip=43.228.187.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dennisn.mooo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=return.smtpservice.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="vAmBMBUo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maow60.a1-4.dyn; x=1706797506; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:Date:From:Reply-To:Sender:
	List-Unsubscribe; bh=6wOXDsYMXryJC8olbLJ6P5OEo2F2Zg8uSPSFAVAq0pA=; b=vAmBMBUo
	R+ld1l06pwwMIi2XNrOoVGVoKJ77pEI9vruYccLcJsq6+rGJkRQIv0qi/yXwTFVw1rwt2Cgtp7e/D
	xIQiP7evKuyt4dbQlqNZKIKrHCoux39ua3OsmnFV5jPZTnZbHO6pPsSVln5NuHAck1ee6rOkODrx5
	DXuewLHZ4Ux7F8oHrJOd30r1nWfEoA5go1+2bCeTWaZdflq59dPUSDnk+hbXUXr9QUxbyajaRROUf
	ui8RZqc+BjeZ4kbR1wln4Hgq/x8zJFC1xyvd2TJjDG/7lsyL9mDLXYx6jN5UGO0ycwOB7QOjCAVoy
	N+jNhNaPtEPnmFo88nqDq+nHmg==;
Received: from [10.45.79.114] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <dennisn@dennisn.mooo.com>)
 id 1rVXlS-l1jh0l-Ip; Thu, 01 Feb 2024 14:10:02 +0000
Received: from [10.220.238.86] (helo=dennisn.mooo.com)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <dennisn@dennisn.mooo.com>) id 1rVXlQ-g31wCT-2n;
 Thu, 01 Feb 2024 14:10:01 +0000
Received: by dennisn.mooo.com (sSMTP sendmail emulation);
 Thu, 01 Feb 2024 09:09:59 -0500
From: "Dennis Nezic" <dennisn@dennisn.mooo.com>
Date: Thu, 1 Feb 2024 09:09:59 -0500
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/2] platform/x86: Add ACPI quickstart button driver
Message-ID: <ZbumN9GuFHp_pJRt@panther>
References: <20240131111641.4418-1-W_Armin@gmx.de> <ZbpqZqyIHuX0s5vz@panther>
 <4bd98f0f-831d-43e4-acfb-f8e65ca027fd@gmx.de>
 <ZbqAkNe3ONcteSQ9@panther>
 <ed222583-e7e0-46f7-929f-4e076f746883@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed222583-e7e0-46f7-929f-4e076f746883@gmx.de>
X-Smtpcorp-Track: 1rVb_Qg31wCT2n.IrY6vDqA-2i6b
Feedback-ID: 498822m:498822aoToIo_:498822soj83CG8eh
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On 31 Jan 18:36, Armin Wolf wrote:
> Am 31.01.24 um 18:17 schrieb Dennis Nezic:
> 
> > On 31 Jan 18:07, Armin Wolf wrote:
> >> The issue is that you machine does not support runtime button events on the quickstart button,
> >> only wake events.
> >>
> >> Can you check if you can now use the unresponsive button to wake the system?
> > Nope, only the main power button can wake it from a sleep state, those
> > quickstart buttons do nothing.
> 
> Can you check if this is still the case when you configure the PNP0C32 ACPI device to be able
> to generate wakeup events (from S5, S4 and S3)?
> Maybe you should unload the quickstart driver for this test.
> 
> If the button still does nothing, then it could be that the quickstart device is not handling
> this button. Then we need some new ideas.

Yea I don't think quickstart/hp-wmi is handling it. As I said, the
behavior is exactly the same as if I didn't have it compiled at all.

I enabled it via /proc/acpi/wakeup (it was disabled initially) (the
S-state in that file only mentions S5, but I guess that should include
all the less sleepy states too). No effect. I tried with and without the
quickstart device.
