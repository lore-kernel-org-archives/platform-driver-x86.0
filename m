Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621AA4AF9DA;
	Thu,  3 Sep 2026 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442684; cv=none; b=eHzbuzLAmuVu3UKZXi1Gb0N+nzRLLVd+uAmXRWz9SCILuHnKef2blHDS6PTUtLxUAgMo1lSvSIQimcDZaz8TfOBkru5F/ef4f+y/kCbxMl18NTAtQh+f1AQJZE9FQbVGImhwYRiFpI5fd58iqrmJc53WhXqiwOjTl7SuBVzbMYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442684; c=relaxed/simple;
	bh=ktIfYhCsUMoubQcDCiOE1ximxmZbH+DOEF7dge4pNBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDf8lNmneJRKVeST0d7m5Z066iqkgLe3h0VbA0hCMHt4QvH1VD/XwjhM4TrVQrfPdFPfaRwrQfhlyIFr9H8czQTPCgEX15FbL8Hx06KNtcnAXkUDM3S/FiXH9OBNi3gWAU8SRAxjpr3JOFwKlFjEMvm+iP5ENGefMkq3F5hIo1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ej8qLhOj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ej8qLhOj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E66E1F000E9;
	Thu,  3 Sep 2026 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788442657;
	bh=rR4uAYXdtJlfzn8D0fNRikucejZopRxwZcTmqq2ExZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ej8qLhOjxic7gSH+RVoL9Zkbas0x9EM7uRcuB4C35lj3ImMgiQi8E/+RNpVazABcc
	 aHAqMFpnCg1iPDzRc8oAZE7pHTzmD80P6+hlH70mSd+Uvj5P0Gi/6Mi9niMI9kMh5i
	 boGcvVmupmmdlyxlTAelJLvbRoPLILMPZO/jFkIdAEcMV/kMBt8mKj3JxTWaTiROhD
	 8JSCa0BwYAtpQ6TRg+WEu22jflSce5JESCZvLAbTAvzlIRQnkFfNPyp53Jjbgoy7AV
	 jgsDuWvoiCsP4kRMPF67zH0OEOCT24HWvKwjPnbKHU3QOozg0fP5ULWEvp3G66SMkT
	 bUqdD67pCCvsw==
Date: Thu, 3 Sep 2026 15:37:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Marshall <pm@petermarshall.ca>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/7] media: i2c: vd55g: move patch array to a separate
 firmware header
Message-ID: <20260903-determined-tough-toad-ad3fb8@quoll>
References: <20260902204549.657228-1-pm@petermarshall.ca>
 <20260902204549.657228-2-pm@petermarshall.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902204549.657228-2-pm@petermarshall.ca>

On Wed, Sep 02, 2026 at 04:45:40PM -0400, Peter Marshall wrote:
> A firmware patch consisting of an array of bytes is uploaded to the chip
> during its boot sequence. Declutter the driver source by moving it to a
> separate header file.
> 
> Signed-off-by: Peter Marshall <pm@petermarshall.ca>
> ---
>  drivers/media/i2c/vd55g-fw.h | 305 +++++++++++++++++++++++++++++++++++
>  drivers/media/i2c/vd55g1.c   | 296 +--------------------------------
>  2 files changed, 306 insertions(+), 295 deletions(-)
>  create mode 100644 drivers/media/i2c/vd55g-fw.h
> 
> diff --git a/drivers/media/i2c/vd55g-fw.h b/drivers/media/i2c/vd55g-fw.h
> new file mode 100644
> index 000000000..02faed7e4
> --- /dev/null
> +++ b/drivers/media/i2c/vd55g-fw.h
> @@ -0,0 +1,305 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Driver for VD55G1 global shutter sensor family driver
> + *
> + * Copyright (C) 2025 STMicroelectronics SA
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +
> +static const u8 vd55g1_patch_array[] = {

Headers should have data, because this can easily lead to duplicated
objects.

static arrays go to C units.

Best regards,
Krzysztof

