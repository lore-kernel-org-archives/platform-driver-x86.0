From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 3/3] toshiba_acpi: Fix the enabling of the Special
 Functions
Date: Wed, 18 Mar 2015 20:58:19 -0700
Message-ID: <20150319035819.GD22993@fury.dvhart.com>
References: <1424973434-3032-1-git-send-email-coproscefalo@gmail.com>
 <1424973434-3032-4-git-send-email-coproscefalo@gmail.com>
 <20150306182821.GI19001@vmdeb7>
 <CAGdLNWHs6iaSCuGHZg_XB=G4pJ9KiW=4-VH1FezmoOuPYRxmhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:33969 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751523AbbCSD6U (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 18 Mar 2015 23:58:20 -0400
Content-Disposition: inline
In-Reply-To: <CAGdLNWHs6iaSCuGHZg_XB=G4pJ9KiW=4-VH1FezmoOuPYRxmhQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Mar 06, 2015 at 11:52:41AM -0700, Azael Avalos wrote:
> Hi Darren,
> 
> 2015-03-06 11:28 GMT-07:00 Darren Hart <dvhart@infradead.org>:
> > On Thu, Feb 26, 2015 at 10:57:14AM -0700, Azael Avalos wrote:
> >> Some Toshiba laptops with the "Special Functions" feature enabled
> >> fail to properly enable such feature unless a specific value is
> >> used to enable the hotkey events.
> >
> > The specific value being... HCI_HOTKEY_ENABLE_SPECIAL? And we do this for ALL
> > systems that support special keys right (and have them enabled)? Not just the
> > ones that fail to properly enable them?
> 
> For all of them supporting "special functions" and have them enabled.
> 
> >
> > The above makes it sound like a work around, but nothing in the implementation
> > suggests that to me. Is this a workaround?
> 
> This is more a fix than a workaround, on the laptops I tested this value
> is needed in order to properly activate the "special functions", if not,
> they will behave like "normal" even if the "special functions"are enabled.
> 
> Tho' I'm not sure if it's only the models I tested or all of them, as I don't
> have that much hardware to test.

OK, I'll wait for v2 and queue for 4.1.

-- 
Darren Hart
Intel Open Source Technology Center
