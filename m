From: Ismael Luceno <ismael.luceno@gmail.com>
Subject: Re: [PATCH] platform: x86: Kconfig: Mention Dell models supported
 by the Compal driver
Date: Wed, 21 May 2014 16:56:36 -0300
Message-ID: <20140521165636.0b1fdd2e@pirotess.bf.iodev.co.uk>
References: <1400434571-17644-1-git-send-email-ismael.luceno@gmail.com>
	<20140520162511.54aad852@alan.etchedpixels.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yk0-f171.google.com ([209.85.160.171]:48132 "EHLO
	mail-yk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752988AbaEUT5E (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 May 2014 15:57:04 -0400
Received: by mail-yk0-f171.google.com with SMTP id 142so2009304ykq.30
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 May 2014 12:57:02 -0700 (PDT)
In-Reply-To: <20140520162511.54aad852@alan.etchedpixels.co.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: platform-driver-x86@vger.kernel.org, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>

On Tue, 20 May 2014 16:25:11 +0100
One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk> wrote:
> >  config COMPAL_LAPTOP
> > -	tristate "Compal Laptop Extras"
> > +	tristate "Compal (and Dell) Laptop Extras"
> 
<...>
> The list btw wouldalso include things like the Dell Vostro 1200 (which
> is a Compal JFT00 I believe). The big problem is that it's really a
> *huge* list of devices from many vendors. The text might even be
> closer to "if in doubt try.."

Thanks for pointing out the issue; putting the list on Kconfig doesn't
make sense, perhaps I should refer to a file under Documentation/...

> 
> dmidecode | grep -i compal can be informative. What does it say for
> the Dell mini's you have ?

Nothing at all :(. It doesn't seem like a reliable way to tell them
apart.
