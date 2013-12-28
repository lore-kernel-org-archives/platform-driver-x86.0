From: Julian Andres Klode <jak@jak-linux.org>
Subject: Re: [PATCH 0/4] thinkpad_acpi: Add support for controlling charge
 thresholds
Date: Sat, 28 Dec 2013 22:10:26 +0100
Message-ID: <20131228211026.GA14725@jak-x230>
References: <1384178195-12218-1-git-send-email-jak@jak-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1384178195-12218-1-git-send-email-jak@jak-linux.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Matthew Garrett <matthew.garrett@nebula.com>
Cc: "open list:THINKPAD ACPI EXT..." <ibm-acpi-devel@lists.sourceforge.net>, "open list:THINKPAD ACPI EXT..." <platform-driver-x86@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 11, 2013 at 02:56:29PM +0100, Julian Andres Klode wrote:
> This patch series adds support for specifying charging thresholds,
> forcing a battery to discharge, and inhibiting charging, on ThinkPad
> Laptops using Sandy Bridge or newer processors.

Hello again,

it's been about 1.5 months now after I submitted this patch series
and I have not received any response yet.

I fixed the issues pointed out by Bj=F8rn Mork in the previous patch
except for the one with the battery names, as I have no idea how
battery numbers are created or mapped. I can only say that the names
are the same on my test machine, I don't have any other ones.

Henrique, it would be really great if you could take a look.
--=20
Julian Andres Klode  - Debian Developer, Ubuntu Member

See http://wiki.debian.org/JulianAndresKlode and http://jak-linux.org/.

Please do not top-post if possible.
