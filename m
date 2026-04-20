Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A948A382393;
	Mon, 20 Apr 2026 06:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776667670; cv=none; b=FJHGILd3wVklsI1yxGrEiApG9dKZkqKYdPvF/peapOVZXWz1ZZA5SP/qLbqcyC0isXJstbEDjA9sVISKRk2nkdhYuyw3XDWdWbuFSDrofi91DqRnZ6dkkG92awWX6I3wCd5KW+UCIx1cXEKeqRiourtz8+6Wihdw7TLzeipjD34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776667670; c=relaxed/simple;
	bh=dDxqaIpXl8IU90dprHiFQaMd1LW33EZrRRzof1h3aW4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OS/sCMJJQcxONTWUWEMcmFgHVhhj9U7f9up9xy08PPVGw2XtmgeeNsI4rhcsTDmziWi0eA08RzMB5PcX4xcHEZgiI4plSWn1pOz4C2GvBUobbC6LDJf47410S0O1l6ozm82M8Yt2J9dUiyC+GjxPPxFg3Y3rXKdLofwZCXOSzzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rgP934gZ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rgP934gZ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7097740B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1776667669; bh=PieXwmhelCRNgShPmCotsV7L6Glc/4XyC9e+/Os+ghA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rgP934gZ3O6CiZ/43sfHGrv2cnvTQpyVFvcUg1vfuyuXslIJvyTPmPKSWVTRwP69P
	 g0UmY/HgQYyS7vItMDavi85UCZcP1MtTskDdRudPjwxSM1+bVo6vSKq/PAa7gV///h
	 DLiEpYbxIAO9CnjYAzWZmoOwOB5HVam4jgFccoywROp1jitAfqGmxXYo67nxaYc84n
	 iR8w3h9rgrMy3dMpVzy8D79Ol/YUX9BBjq7wWcRIv1ruErKR7on0M4V83JnresQz9f
	 osesOAv/+ZTxfGvLUK58/fUkCNQ6dOqma6ic8AZrUPfBA5rGzr8x5kH7inu3aewUGS
	 RdgcmRdYxFRrA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7097740B0C;
	Mon, 20 Apr 2026 06:47:48 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>, Ninad Naik <ninadnaik07@gmail.com>, Armin
 Wolf <W_Armin@gmx.de>, skhan@linuxfoundation.org
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, me@brighamcampbell.com,
 linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] Documentation: fix spelling mistake "Minumum" -> "Minimum"
In-Reply-To: <BAA4F3A7-E892-4904-95A6-64B177CDA7AD@gmail.com>
References: <20260419170835.347910-1-ninadnaik07@gmail.com>
 <b94cef14-d02d-4544-abb5-ead7db6eaa72@app.fastmail.com>
 <BAA4F3A7-E892-4904-95A6-64B177CDA7AD@gmail.com>
Date: Mon, 20 Apr 2026 00:47:45 -0600
Message-ID: <87fr4qw2jy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Derek J. Clark" <derekjohn.clark@gmail.com> writes:

> The MOF spelling mistakes are well known. We've left them is as to
> ensure match with what the hardware actually reports.
>
> See: https://lore.kernel.org/platform-driver-x86/cfd7977e-d612-4e08-a68a-65fed8e164b6@gmx.de
>
> I suppose if we're going to continue getting these types or PR I
> should add a note to the documentation. I'll add that soon.

Perhaps worth adding, but I'm not sure I would expect it to help.  The
people generating these patches aren't putting much attention into the
context surrounding them.

Thanks,

jon
