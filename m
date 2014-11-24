From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 1/3] platform: x86: dell-rbtn: Dell Airplane Mode Switch
 driver
Date: Mon, 24 Nov 2014 20:09:05 +0000
Message-ID: <20141124200905.GB3459@srcf.ucam.org>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1416755361-17357-2-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:35921 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754338AbaKXUJK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 24 Nov 2014 15:09:10 -0500
Content-Disposition: inline
In-Reply-To: <1416755361-17357-2-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>

On Sun, Nov 23, 2014 at 04:09:19PM +0100, Pali Roh=E1r wrote:

> +	/* NOTE: rbtn controls all radio devices, not only WLAN
> +	         but rfkill interface does not support "ANY" type
> +	         so "WLAN" type is used
> +	 */

If it controls multiple radio types then you should register multiple=20
rfkill devices.

--=20
Matthew Garrett | mjg59@srcf.ucam.org
