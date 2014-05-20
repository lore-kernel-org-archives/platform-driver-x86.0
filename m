From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] platform: x86: Kconfig: Mention Dell models supported
 by the Compal driver
Date: Tue, 20 May 2014 16:25:11 +0100
Message-ID: <20140520162511.54aad852@alan.etchedpixels.co.uk>
References: <1400434571-17644-1-git-send-email-ismael.luceno@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:34166 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751161AbaETPZR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 20 May 2014 11:25:17 -0400
In-Reply-To: <1400434571-17644-1-git-send-email-ismael.luceno@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ismael Luceno <ismael.luceno@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>

>  config COMPAL_LAPTOP
> -	tristate "Compal Laptop Extras"
> +	tristate "Compal (and Dell) Laptop Extras"

Compal make laptops for lots of companies (second only to Quanta). In
some cases they make complete "product" and companies slap their logo on,
in other cases they make laptops for companies. So it's not just Dell but
includes some Toshiba and many other makes.

Equally I think it's fair to say that most people configuring their
kernel are not going to know if their laptop is a rebadged Compal or
something with the same interfaces so adding more info as you are doing
is a good thing. Perhaps however it should be Compal (and some other) ?

The list btw wouldalso include things like the Dell Vostro 1200 (which
is a Compal JFT00 I believe). The big problem is that it's really a
*huge* list of devices from many vendors. The text might even be closer
to "if in doubt try.."

dmidecode | grep -i compal can be informative. What does it say for the
Dell mini's you have ?

Alan
