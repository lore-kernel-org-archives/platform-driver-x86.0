Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B822C47044A;
	Fri,  2 Oct 2026 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935228; cv=none; b=TO38dPq+00WgVJLOC5sAoRq+SvsczkKeJwmCNt+eE0p6uukTCF/R3elb6ISmRIJPvagHDU3pek4wexqPdxxgla7alrGuLe4Ymm2PogR2Fz+xKCxTHkPykVwDh+Sp7nMf2QmXYtjg3dOesMznuJpoWFvh8emwG5M6F6OZCqtkc80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935228; c=relaxed/simple;
	bh=U/rEy96x8NIZYBxrf6rWQCoz1Pk+00W5Rt3Lw0oq60Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3pzIOg4bDap/GTCOA35aYT1wPJHXfElKVOFSAw0sXcle0rS7w8wGrNqV/l18qIEV88LWQyraaxUNZrzIb4oTQAObSmoEflkJj4FjXRK0ayQ86KZYvTcrMMFVJDDZcVKF0uK3ji884LC5Camqn9GfmLgy7KcUctvX3/OFG3B9vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CiYxpCj7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CiYxpCj7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286A01F000FF;
	Fri,  2 Oct 2026 10:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790935227;
	bh=JuRZqetjo9xfYHtDOCbU7yAtoOToOjR2ij3xnsnlR5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CiYxpCj7SQzDYLVF4zCwIgZ5cGeMyXfVm5CqZKF//W0ES8OW8PIF/xiABpkpz2uCV
	 q7QxEaER8UX67yjwz4S/7hrmeOvE/aENQIPrDR08Qp4Mgn1PBT470ydsHJVvA5qbFL
	 Rw3ir5HO0g33gLOqCXvG4CD7wcbmMjy6X7P2gnwA1Iljl1ZyWccg3nhTKtiADo+ui8
	 pmTM7cEg00cwuPHzmfIN4Fwq7pVPz3HFDVtCwrzonucmEPnRij6OJa9qc+FX+N0fL0
	 n1+v/1DBo0lJ8BidUodNdktzONtFCa/REJroNXv/uFccrrZM5hhcXooobYwblX4dwl
	 Uq2dnh1w6QDgg==
Date: Fri, 2 Oct 2026 11:00:21 +0100
From: Lee Jones <lee@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Thierry Chatard <tchatard@gmail.com>, andriy.shevchenko@intel.com,
	linux-kernel@vger.kernel.org, hansg@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com, dmanresa@gmail.com
Subject: Re: [PATCH v11 1/9] mfd: intel-lpss: add resource conflict quirk for
 Dell Latitude 5285
Message-ID: <20261002100021.GA13860@google.com>
References: <20260930214321.600863-1-tchatard@gmail.com>
 <20260930214321.600863-2-tchatard@gmail.com>
 <ar3wg-Q3rRjlFPlG@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar3wg-Q3rRjlFPlG@kekkonen.localdomain>

On Thu, 01 Oct 2026, Sakari Ailus wrote:

> Hi Andy, Lee,
> 
> Are you ok with merging this and the following patch via the media tree?
> 
> I guess there's no direct dependency, so I could take only patches from 3
> onwards via the media tree as well. In that case:
> 
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

If there are no deps, let's just take them through their own trees.

> On Wed, Sep 30, 2026 at 02:43:13PM -0700, Thierry Chatard wrote:
> > The Dell Latitude 5285 2-in-1 has a BIOS bug where the ACPI GEXP device
> > and the I2C4 controller (INT3446) both claim the same MMIO region via the
> > shared SB04 variable. This causes intel_lpss_acpi to fail binding to I2C4
> > with -EBUSY, preventing the front camera (OV5670) sensor from being
> > registered.
> > 
> > Match the affected machine by DMI and the affected device by ACPI ID,
> > carrying QUIRK_IGNORE_RESOURCE_CONFLICTS in the ACPI match data and
> > applying it to the per-device info in probe. This follows the quirk
> > organisation used by the PCI counterpart.
> > 
> > Assisted-by: Claude Code:claude-opus-4-8
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Signed-off-by: Thierry Chatard <tchatard@gmail.com>
> 
> -- 
> Kind regards,
> 
> Sakari Ailus

-- 
Lee Jones
