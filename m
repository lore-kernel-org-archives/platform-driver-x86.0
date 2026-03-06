Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F61F289E13;
	Fri,  6 Mar 2026 12:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772801625; cv=none; b=fxEme6OfMFcwn0MqX6rS4ibwYEaOXx4mzb6GqFibBh8iVvKQrDwCkO0fhXOYgyDHH5hfLkt9KDPoABmnXwEwrhi2qjgWWMcoj7oxDdhvtXUoT3FtdoddOxN2/Q8sHJMn8f7doXzUt2e+WoX51q23ptId0EVRT50FDLYBsblYlWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772801625; c=relaxed/simple;
	bh=6sD9DKgwgkgML8o1MlRbusuMzQH8Mhs9E1w7huiVTRs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GkU9VZzGexnR0DDbbFvwvOQaz1hwX2q/Vh++lfZYpqjLpXx278JjkW9u7BqhrCRUwQg4vnZxUsGERU43NtT1/S8ANvL64d/FfkfGsV1HpZt06fq7s9WXY5pbxABYC6eCCrzRW5L3WN2qRocfN8mprzuqC1vd4bK5nOkUbFlssJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5OHHLcT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5OHHLcT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51316C4CEF7;
	Fri,  6 Mar 2026 12:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772801624;
	bh=6sD9DKgwgkgML8o1MlRbusuMzQH8Mhs9E1w7huiVTRs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z5OHHLcTtJLfw/xaA9nt0RPGM/mzOgTZBQ2jRwlgxK8vN9MYlIwls3XDwS+ePSBx4
	 0X7BlcLrw/ldLfkhiXxSiQWbdcrwYK89Q0HfE66HXfrPxOj2ZYqkshOzFB5Q8A4Ory
	 Y29sjXYb0Ij/7AgMODLR6/Kblix+blmPWAu1KWQGGcIiIpa9RSpEr7bCOLZngQoXc9
	 cM7lR5wFyTIhoniq263cg7UVrQq2gBhRCeTTUSAHk3eGaRRAYD6/EYYqJGZ8wAez+p
	 OZ6Oj+tQh8gqBxrW1Yvw2EekvgjsxZc73AY84fxQyNDGuMxc7lH3h1KtNUPeLkPO+T
	 NiPJXEmEVShVg==
From: Lee Jones <lee@kernel.org>
To: Peter Tyser <ptyser@xes-inc.com>, Lee Jones <lee@kernel.org>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 brgl@kernel.org
In-Reply-To: <20260218-meraki-swnodes-v2-1-92c521da241c@oss.qualcomm.com>
References: <20260218-meraki-swnodes-v2-1-92c521da241c@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 1/2] mfd: lpc_ich: expose the GPIO
 controller cell's software node
Message-Id: <177280162204.1002992.12499935361323933725.b4-ty@kernel.org>
Date: Fri, 06 Mar 2026 12:53:42 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Wed, 18 Feb 2026 11:48:01 +0100, Bartosz Golaszewski wrote:
> One of the users of this driver - meraki-mx100 - abuses the software
> node API by setting up a dummy software node without any logical link to
> this GPIO controller and uses the fact that the GPIO core matches the
> controller's label against the swnode's name to make the lookup work.
> 
> We want to remove this behavior from GPIOLIB in favor of actual matching
> of firmware nodes but that would break this user. To facilitate that:
> create a software node for the GPIO controller cell and expose its
> address in the provided MFD header.
> 
> [...]

Applied, thanks!

[1/2] mfd: lpc_ich: expose the GPIO controller cell's software node
      commit: a64ee7d8ddd6e04d82c06238a238b7877cbc35fc

--
Lee Jones [李琼斯]

