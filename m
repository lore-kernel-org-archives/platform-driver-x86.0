Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D88A20E6;
	Thu,  5 Sep 2024 05:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725513599; cv=none; b=cJ1YhsKYpO3pPtpw+VngnOfIjTyICVJ4S5cZi1DFR7dycQgOQ5fsO52obhHDh47gGHRF+vBFKLg453WptEr5tn+tCxYy1mumKo82+yO7zw2XfIrSEhhqKv5+cWJ3UKd0gnbELeuna64nLOXd3YhM+Ms6NkIRssA5Jy9g7X3Zt7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725513599; c=relaxed/simple;
	bh=O9pJtwUR9UjaKO3DEpJf/TT25cCybHtD1QiMZe5h93o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0Bgs48YUO5ZeGzLFzQllafEYooycWVKQ3feIJQ7+M1wCwxUkSHIoTg3fAi4J0lRjFz9lE/VAOyaRXFHjub1yIXnsbYSlQAguo82aTfjRMXjeHvTsIaRhumAEgtXntPXAm0Ht+ipiJq8Dw8hZSWiqeadNr/Z6NYNz3EGRpoPtfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sKRbmRzq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sKRbmRzq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8645AC4CEC4;
	Thu,  5 Sep 2024 05:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725513598;
	bh=O9pJtwUR9UjaKO3DEpJf/TT25cCybHtD1QiMZe5h93o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKRbmRzqVdVhqLBh4M3IjCxwbRrLtA0bik7v4pnndhrtr5in5pygBtO440RIw9pd+
	 F18CKd0/rhu1elCFJsvSzwFDt0kJtq7Ah5ZmjcxtSLUL/A/0y8E1OTMOOWnQNw+NNo
	 r49wpRhmS/Y4JpSnV0hNYxnVH78zryh90GSWPXmE=
Date: Thu, 5 Sep 2024 07:19:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, jorge.lopez2@hp.com,
	acelan.kao@canonical.com, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: linux/usb.h: Move USB port definition to usb.h
Message-ID: <2024090516-battering-prompter-3f53@gregkh>
References: <20240905042447.418662-1-kai.heng.feng@canonical.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905042447.418662-1-kai.heng.feng@canonical.com>

On Thu, Sep 05, 2024 at 12:24:46PM +0800, Kai-Heng Feng wrote:
> Move struct usb_port to linux/usb.h so other subsystems can use it too.

These really are "internal to the usb core" functions and variables, I
am loath to export them as it requires that you "know" what the device
type is of something without any recorse if you get it wrong.  I
commented on patch 2/2 about that.

Could we provide a usb core function for you instead to help out?  What
exactly are you trying to get access to on the USB bus that you need to
use here, the port or the device?

thanks,

greg k-h
