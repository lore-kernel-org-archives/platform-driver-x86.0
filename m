From: Jonathan Nieder <jrnieder@gmail.com>
Subject: Re: [PATCH linux-3.1.y] ideapad: Check if acpi already handle
 backlight power to avoid a page fault
Date: Tue, 10 Jan 2012 18:56:46 -0600
Message-ID: <20120111005646.GT22184@burratino>
References: <CAFVLVSOp750X4L+qgR16Qc53V+jOKsxA-ujskx3K0BX9kQOzTw@mail.gmail.com>
 <20120111004256.GS22184@burratino>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:43612 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755357Ab2AKAvt convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 Jan 2012 19:51:49 -0500
Content-Disposition: inline
In-Reply-To: <20120111004256.GS22184@burratino>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: stable@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, Artem X <artem.brz@gmail.com>, Rene Bolldorf <xsecute@googlemail.com>, Matthew Garrett <mjg@redhat.com>, Ike Panhc <ike.pan@canonical.com>, Corentin Chary <corentin.chary@gmail.com>

Jonathan Nieder wrote:

> From: Ren=C3=A9 Bollford <xsecute@googlemail.com>
> Date: Sun, 23 Oct 2011 09:56:42 +0200
>
> commit d4afc7754a60b885b63ef23fd194984e2d53a4e6 upstream.
>
> This patch avoid a page fault in the ideapad-laptop extras when
> turning the backlight power on or off.
>
> Signed-off-by: Rene Bolldorf <xsecute@googlemail.com>

I believe Ren=C3=A9's last name is Bolldorf, not Bollford as in the "Fr=
om"
line.  (The typo comes from the commit log and I forgot to check it
before sending.)  Either way --- sorry for the noise, and Ren=C3=A9, so=
rry
for mangling your name.
