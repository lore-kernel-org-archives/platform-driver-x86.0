Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F2A145A1F;
	Wed, 13 May 2026 06:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778653501; cv=none; b=TM/ZDEKU9Q/LVTqk1REI8OZYBQwa166R7jd8KaAWMuxScXARnuXMsD8a63Qh3OE1XWlcugM5bypWhlDBPQKphWA8mlWdhJsB/hDjW/Z1+MROjvyuInCSIBJ7vwEPmbd3PthfgPfS7iRjrWPWrX8458Ja8ILfZJJH0joXzjcGDZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778653501; c=relaxed/simple;
	bh=axN6COC4cojegolgFEk+LYWqMfB4csSS/r0+4jpKaS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STCWECFq3vAZww66O8rOwkPGdnVlUp55tPW+KFYCXuAiPGh3thpJq2K1rfHi4TNNdQ3wpp8hE8nAAb52LLygUFJL2z5xmhkydsEdrHblgpRHL9aBCqZ5UGV4he+JCObQNhgeKa/6xBDVXeKhVLifSyTjYtTnj1E8e46wFXJe7h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Cqyx+4kv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Cqyx+4kv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC2FC2BCB7;
	Wed, 13 May 2026 06:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778653500;
	bh=axN6COC4cojegolgFEk+LYWqMfB4csSS/r0+4jpKaS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cqyx+4kv9V3+OXq6DzLPciFG1FPUsD6c4hbfyGC80Qc4fOP4klE6bk3fINRXbMSBw
	 Akmz026/Wqjfgg8sY3YndA/WAJ4qb+EMomjZHZVPPiYqAkO424DvUQa/l979PSBpEZ
	 LV0tguyYMFfeMQrXmbQS/+uXeMqw+ss98f99YHqQ=
Date: Wed, 13 May 2026 08:24:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com,
	rafael@kernel.org, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH v2 4/7] sysfs: Add SYSFS_HUGE_BIN_FILE flag for binary
 attributes larger than PAGE_SIZE
Message-ID: <2026051354-succulent-acting-e006@gregkh>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
 <20260427155129.545327-5-muralidhara.mk@amd.com>
 <2026051214-getaway-mammary-debb@gregkh>
 <47c6134b-c0ed-44af-b77e-145bfceded74@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47c6134b-c0ed-44af-b77e-145bfceded74@amd.com>

On Wed, May 13, 2026 at 09:43:57AM +0530, K Prateek Nayak wrote:
> Hello Greg,
> 
> On 5/12/2026 5:31 PM, Greg KH wrote:
> > On Mon, Apr 27, 2026 at 09:21:26PM +0530, Muralidhara M K wrote:
> >> Historically, sysfs read buffers were allocated with get_zeroed_page(),
> >> limiting reads to PAGE_SIZE.  Commit 13c589d5b0ac ("sysfs: use seq_file
> >> when reading regular files") transitioned regular (text) attribute reads
> >> to seq_file, which can dynamically grow buffers beyond PAGE_SIZE.
> >> However, the PAGE_SIZE limit was intentionally preserved for
> >> compatibility.  When binary attribute handling was later unified into
> >> the same codebase, the non-seq_file read path (kernfs_file_read_iter)
> >> retained this PAGE_SIZE cap for binary files as well.
> >>
> >> Drivers that expose binary attributes larger than PAGE_SIZE — such as
> >> the AMD HSMP metric table (~13 KB) — cannot deliver the full content
> >> in a single read() call through the existing path.
> > 
> > That's fine, userspace must be able to handle a "short" read, and will
> > just continue on and read everything afterward, right?  You can't rely
> > on userspace always asking for more data.
> 
> I think this is complicated by the HSMP driver bits that requires the
> read to issue a HSMP command to the hardware first to updates the
> table before copying from the MMIO region.

Then you have bigger problems here :(

> If a concurrent reader arrives, they'll refresh the table for their
> PAGE_SIZE chunk read and the prior user will see a torn value. For
> most part it shouldn't be a problem but folks try to co-relate the
> Temperature and Power data from the first chunk with the Throttle
> Indicators in the second chunk and sometimes, they don't match the
> expectations.

Again, this is a problem, perhaps do not use sysfs for this?  You can't
control userspace, and to expect it to always work properly is not going
to end well.  This change isn't going to fix your problems listed above
at all.

> The table should never have grown this big but some folks decided it
> was a good idea and we can't fix it for a while and have hit the
> PAGE_SIZE limit now.

Just delete it and use a different interface to the kernel instead
please.  If you need atomic read/writes, use an ioctl.  Don't try to fix
sysfs into something that it was not designed for at all.

> If there is a better alternate, we are all ears, and more than happy
> to try out an alternative suggestion for the described problem.

A misc device sounds like the properly solution.

> >> Introduce a new opt-in flag SYSFS_HUGE_BIN_FILE (040000) that drivers
> >> can OR into their bin_attribute mode.  When set, sysfs selects a new
> >> kernfs_ops (sysfs_bin_kfops_huge_file_ro) whose .seq_show callback
> >> pipes the bin_attribute ->read() result through seq_file, allowing
> >> reads of arbitrary size in one shot.  Existing binary attributes
> >> without the flag continue using the legacy capped path.
> > 
> > If this is such a big issue, why not just do it always for binary files?
> > What is the benefit of keeping two different code paths just for this
> > "new" flag?
> 
> We can do that! For bin attributes that specify .size or a size
> function, we can use a flexible buffer and for the ones that don't, we
> can enforce a PAGE_SIZE cap like today.
> 
> Would that be okay?

Overall, yes, but again, I don't think this is going to fix your
problem.

thanks,

greg k-h
