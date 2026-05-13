Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A86138E8C1;
	Wed, 13 May 2026 07:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656777; cv=none; b=K+uAkopCjcVOfSJlgG3v2GXJwvjk8A5IBqYC5lCCvH7B0E8F1ryYQiHEKFv9olEJXMS7wPu7DSmM1bcujb/8r7vf/X0+E8s+yBQ6hKAmp/WnDKRKsRFqhwKxHu4zDkWoHXYmSGn17f2OgULj73Pv8FoJuydurcFLW7rtoi7OOGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656777; c=relaxed/simple;
	bh=HQi8BFqrVsYLslT+Y1rf8I/7LmH3U0xUSOq4nDHrXKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUQ2i2vh0i6sAgbpzC0ihSO4nNU8UE2AKj+e9Dz8BFYgaaZZeqAvR2M0bwIdqb5K1aN0Cks1P8Yg/Rx25lAzhdvPH5vD7GYSgOg73SHZC9ZVr/XaJ+djmiz3rJFOSvx7/hJMUmgtDJ6whEu276xo1aU5TZfbIwMTOhAdO6dIE3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FBDWyHrr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FBDWyHrr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876E7C2BCB7;
	Wed, 13 May 2026 07:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778656776;
	bh=HQi8BFqrVsYLslT+Y1rf8I/7LmH3U0xUSOq4nDHrXKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FBDWyHrrm5m96DbyRae+5w5weJ/+rm/IEfd64doZids8U5GGlrc6G0R7hpnliSuAk
	 5/Bu64X3HFPyjZSb31F1UJjko+08kMWG73eyBMXmULb1UL7bQULdqPBlHdXINZIPSr
	 1x8WiBKY9y0MzWt+9cZ9gVBpoZ0+NavTHbRPp2kM=
Date: Wed, 13 May 2026 09:18:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com,
	rafael@kernel.org, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH v2 4/7] sysfs: Add SYSFS_HUGE_BIN_FILE flag for binary
 attributes larger than PAGE_SIZE
Message-ID: <2026051334-cattishly-choice-4859@gregkh>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
 <20260427155129.545327-5-muralidhara.mk@amd.com>
 <2026051214-getaway-mammary-debb@gregkh>
 <47c6134b-c0ed-44af-b77e-145bfceded74@amd.com>
 <2026051354-succulent-acting-e006@gregkh>
 <972e0f45-074b-455d-80b5-f78d6e20fb3b@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <972e0f45-074b-455d-80b5-f78d6e20fb3b@amd.com>

On Wed, May 13, 2026 at 12:06:11PM +0530, K Prateek Nayak wrote:
> Let me know if you would like the bin attr bits moved to seq_file
> based reads similar to sysfs_file_kfops* and I can find some cycles
> to do it irrespective of the HSMP bits :-)

No need unless you really want to.

thanks,

greg k-h
