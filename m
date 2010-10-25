From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] toshiba_acpi.c: Add key_entry for a lone FN keypress
Date: Mon, 25 Oct 2010 11:27:35 -0700
Message-ID: <201010251127.37374.dmitry.torokhov@gmail.com>
References: <20101023221253.GA4829@hathor>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:47002 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751518Ab0JYS1q convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Oct 2010 14:27:46 -0400
In-Reply-To: <20101023221253.GA4829@hathor>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jon Dowland <jmtd@debian.org>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Saturday, October 23, 2010 03:12:53 pm Jon Dowland wrote:
> A lone FN key press on a Toshiba Port=E9g=E9 R700 without another key=
 in
> conjunction results in an ACPI event and a spurious error message on
> the console.
>=20
> Add a key entry to map this event to a KEY_UNKNOWN keypress silences
> this message.
>=20

Well, if FN key can generate separate events then we should report
KEY_FN, not KEY_UNKNOWN.

Thanks.

--=20
Dmitry
