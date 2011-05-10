From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [GIT PULL] x86 platform driver updates
Date: Tue, 10 May 2011 08:40:32 +0200
Message-ID: <BANLkTim-momwpCCwZtL8sQyCmUvQ_Fz8Gw@mail.gmail.com>
References: <20110509185727.GA9811@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:34821 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751867Ab1EJGke convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 May 2011 02:40:34 -0400
In-Reply-To: <20110509185727.GA9811@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> the rfkill code on
> the Eee is currently completely broken for PCIe systems that don't pu=
t
> devices on bus 0.

> Matthew Garrett (1):
> =C2=A0 =C2=A0 =C2=A0eeepc-laptop: Use ACPI handle to identify rfkill =
port

Hi Matthew,
Thanks for fixing that.
Should this also go to stable ?
If you have the hardware, could you also fix asus-wmi (1000H is the
only eeepc known to use both hotplug and eeepc) ?
Thanks,

--=20
Corentin Chary
http://xf.iksaif.net
