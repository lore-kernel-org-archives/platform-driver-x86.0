Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7537036A01D;
	Mon,  9 Mar 2026 09:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050129; cv=none; b=IRnkuRiDD6IhDAlDnWhFW8vJdxIRGvGP5ilcvIeUxDca3UaIv03mVm1QJcgZiuOUVTpp0G7G03xW9XR1HSHOdJPbw3WJABvuSoQLJLGjlv2zw3XimwDZxoCGXc7MuozNypAitcYJgZfSfX37aWHQWFwLPhZ6cOK+m28BCgR+TQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050129; c=relaxed/simple;
	bh=we+ynEaxEJljlO1e8UjE9z8gKYStXBJce3u9lc1S3Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQfC0yuFJXHdLcKrB3OOVjfEg2MGopG/JbtSlfZO8sdlbrx7PgcOBI8116CKgawPJKbcSbwp1xZ+Kp18jgMfpZ2vW2g2RJc+uZ48ooZEhvY05Ky+n0IiVXc4Wcp++5SvKWeKUVbkb8lD0Ui9BcyQINhj4+MSieMLEa/DjIeN2u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=namgH9N7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="namgH9N7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCAFC4CEF7;
	Mon,  9 Mar 2026 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773050129;
	bh=we+ynEaxEJljlO1e8UjE9z8gKYStXBJce3u9lc1S3Cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=namgH9N7nfaDaYSLl88yUlE4MYzjsfB+4C+ohFRkHc7MGowbVGRa4krTtkFyRm25h
	 1r4kta5sR6Q7YjlCe4uILhbWGZIOPDqw0ngp4ioElR1j8wy5ceWbBDjs/uRGDk7f8F
	 jKI5ws1BPHPLNoDP6iTwMhZNjUw+gojhZrFb8mt4oAxco/bthboOBxrNYyZdXfp0aa
	 VcOb29OmyHSIg+UkbqRmTxiCuMrN6hRVJBKEpo8zzXMkZbuXVBe9baxCQFfKSl72TL
	 HI2e0PQ1x0WyoRWyjEJ3KoXtWrCt32XN1c4nT4iQMAwsOr2QRjp4TUuU5VK3XeBJYp
	 X+apEmQfsOu1A==
Date: Mon, 9 Mar 2026 09:55:23 +0000
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Tyser <ptyser@xes-inc.com>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/2] mfd: lpc_ich: expose the GPIO controller
 cell's software node
Message-ID: <20260309095523.GT183676@google.com>
References: <20260218-meraki-swnodes-v2-1-92c521da241c@oss.qualcomm.com>
 <177280162204.1002992.12499935361323933725.b4-ty@kernel.org>
 <CAMRc=McqOD6FTQ9OGWUatL1NHHiW_O0YUZZK=CSHxOJNadhqEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McqOD6FTQ9OGWUatL1NHHiW_O0YUZZK=CSHxOJNadhqEw@mail.gmail.com>

On Fri, 06 Mar 2026, Bartosz Golaszewski wrote:

> On Fri, Mar 6, 2026 at 1:53 PM Lee Jones <lee@kernel.org> wrote:
> >
> > On Wed, 18 Feb 2026 11:48:01 +0100, Bartosz Golaszewski wrote:
> > > One of the users of this driver - meraki-mx100 - abuses the software
> > > node API by setting up a dummy software node without any logical link to
> > > this GPIO controller and uses the fact that the GPIO core matches the
> > > controller's label against the swnode's name to make the lookup work.
> > >
> > > We want to remove this behavior from GPIOLIB in favor of actual matching
> > > of firmware nodes but that would break this user. To facilitate that:
> > > create a software node for the GPIO controller cell and expose its
> > > address in the provided MFD header.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/2] mfd: lpc_ich: expose the GPIO controller cell's software node
> >       commit: a64ee7d8ddd6e04d82c06238a238b7877cbc35fc
> >
> > --
> > Lee Jones [李琼斯]
> >
> 
> Hi Lee!
> 
> Can you pick up patch 2/2 as well as per Ilpo's response and Ack?

Are there dependencies between the two patches?

-- 
Lee Jones [李琼斯]
