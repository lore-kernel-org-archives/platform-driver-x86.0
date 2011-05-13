From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Subject: Re: [RFC 2/5] gpio: add support for Technologic Systems TS-5500 GPIOs
Date: Fri, 13 May 2011 17:33:52 -0400
Message-ID: <1305322106-sup-3383@v0nbox>
References: <1304115712-5299-1-git-send-email-vivien.didelot@savoirfairelinux.com> <1304115712-5299-3-git-send-email-vivien.didelot@savoirfairelinux.com> <20110430111536.5cb49d59@lxorguk.ukuu.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([209.172.62.77]:48760 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756496Ab1EMVdz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 13 May 2011 17:33:55 -0400
In-reply-to: <20110430111536.5cb49d59@lxorguk.ukuu.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Jerome Oufella <jerome.oufella@savoirfairelinux.com>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, linux-serial <linux-serial@vger.kernel.org>, lm-sensors <lm-sensors@lm-sensors.org>

Excerpts from Alan Cox's message of sam avr 30 06:15:36 -0400 2011:
> > +    /* Enable IRQ generation */
> > +    mutex_lock(&drvdata->gpio_lock);
> > +    PORT_BIT_SET(0x7A, 7); /* DIO1_13 on IRQ7 */
> > +    PORT_BIT_SET(0x7D, 7); /* DIO2_13 on IRQ6 */
> > +    if (use_lcdio) {
> > +        PORT_BIT_CLEAR(0x7D, 4); /* Enable LCD header usage as DIO */
> > +        PORT_BIT_SET(0x7D, 6);   /* LCD_RS on IRQ1 */
> > +    }
> 
> What happens if an IRQ occurs at this point, you have no handler for it ?

The IRQ is just not handled. What would be the proper way to handle
that? Would it be possible to write those registers when the IRQ is
requested?

Thanks,
Vivien.
