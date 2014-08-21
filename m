From: Karol Babioch <karol@babioch.de>
Subject: Re: [PATCH] ideapad-laptop: Use intel_backlight only on Lenovo B470e
Date: Fri, 22 Aug 2014 01:35:33 +0200
Message-ID: <53F68245.20403@babioch.de>
References: <1408342153-16764-1-git-send-email-yidi.lin@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="xqQPjLIj0QlxS1FTM32PRdP1jk3Cd7a8t"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from babioch.de ([176.9.120.167]:33058 "EHLO babioch.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750854AbaHUXnj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Aug 2014 19:43:39 -0400
In-Reply-To: <1408342153-16764-1-git-send-email-yidi.lin@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Edward Lin <yidi.lin@canonical.com>, platform-driver-x86@vger.kernel.org
Cc: mattia Dongili <malattia@linux.it>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xqQPjLIj0QlxS1FTM32PRdP1jk3Cd7a8t
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Edward Lin,

Am 18.08.2014 um 08:09 schrieb Edward Lin:
> ACPI video is not functional on Lenovo B470e.
> The brightness control is also broken with vendor mode.
> The brightness control only works with intel_backlight.

By looking at your description (and your patch) I'm wondering how
exactly this problem made itself apparent? I'm having a similar (the
same?) issue with my Sony Vaio VPCS12C5E. The backlight interface
registered by ACPI does not work and I have to boot with the command
line option "acpi_backlight=3Dvendor". Even then two interfaces get
registered "nv_backlight" and "sony", only one of which (nv_backlight)
works.

Desktop environments (GNOME in particular) seem to be confused by this,
so I always have to change the brightness by writing directly into the
"actual_brightness" file. I've reported this back in 2012 [1], but was
told that it is an ACPI issue and so it never was fixed.

Couldn't a similar patch be applied to the sony-laptop module? I've
added Mattia Dongili to the discussion, hopefully he doesn't mind to
take a look at this again. I'm glad to test any patches, but am not
familiar enough with all of the internal structs to mess around with
them for myself without breaking support for other users of this module,
especially since my model was shipped with in two different versions:
One with the internal Intel GPU and another with a dedicated Nvidia GPU.
I'm afraid a simple DMI match might not be good enough in this case?

Best regards,
Karol Babioch

[1]: http://www.spinics.net/lists/platform-driver-x86/msg03406.html


--xqQPjLIj0QlxS1FTM32PRdP1jk3Cd7a8t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT9oJGAAoJEHSaZc1HnzIVEb0QAJZI8a1LT6vOEyRqbMfsSZnc
xaQ6rHMOYv+ks1C3AKgDLsiNYykYSY/A6v7rs78bJvLpiWPfXob6bUbJ6CAkq4Lz
FMqJHcKO4JN75LiCfNAFnBjw5EZ4I4pW8E3sNhN3CSIcur0UMmczBdGgRAVIu2w9
BRiyRrUwfINUB3Ayrd0jEpzwvZjHJsTwWInZkSZwsnI4xto6oNg4F2HuvDuxxmLf
w3hyonluTrEPps0rjIHrzp2QcqWdPLw8ifHO+EiPCeTE50TRruqfucX+PAnBDSMv
svM5mAwPc3TmNRfS0Ypw3Imbc3ZNMXMjMZkPEf9NhPhE/S3R0eGeRTWF69kiRJrP
BxK5hoJWHDqKzMVhYi08V8795RaSrQK2dXaWQZeQht5isfkjAwmjwmXpR3x1Q7tW
Pt1W2Y0DlAdhYQ4VD/4Oubl8BDhc41Bmrffd89+BNiLr7fpTPG9bgq0idaGUUQ/k
ucIsU34Jdkxjk0VZ+juVgIb67ZG2GBneh+rW0cpsAUQ1JfqrOYUrJh+xy3YU9NWG
CgZU8Adv4B6QpeFTI4e9YocvxgF5jtaNxBzFrwRi/I192JzRga/JcIA3bkdaVrGC
l0BQd/J8FwRmAaO39/bbFZghcrUErd9eIQf3Wl1eblZ/2wYplowdMyxYABgvENm3
Xa/fO624ROs85fMo9ufA
=Uo8J
-----END PGP SIGNATURE-----

--xqQPjLIj0QlxS1FTM32PRdP1jk3Cd7a8t--
