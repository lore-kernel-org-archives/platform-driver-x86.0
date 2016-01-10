From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v2 0/1] apple-gmux: Add initial documentation
Date: Mon, 11 Jan 2016 00:08:35 +0100
Message-ID: <cover.1452431795.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout2.hostsharing.net ([83.223.90.233]:56551 "EHLO
	mailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757634AbcAJXIn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 10 Jan 2016 18:08:43 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>
Cc: Darren Hart <dvhart@linux.intel.com>, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Bruno Premont <bonbons@linux-vserver.org>

On Fri, Jan 08, 2016 at 09:49:22AM -0700, Jonathan Corbet wrote:
> Well, it's built around the asciidoc patch, which isn't in the mainli=
ne
> at this point.  Should things go a different direction, that could fo=
rce
> some changes here;

If/when that happens, I'll be happy to fixup the documentation as neede=
d.
In fact I originally wrote this in markdown in November, then converted
it to asciidoc in December and that really wasn't a big deal.

The need for asciidoc arises from the desire to not clutter up the pros=
e
text with URLs. To achieve this, asciidoc allows defining so-called
"attribute entries" which may then be referenced in the text:
http://asciidoc.org/userguide.html#X62

Markdown has a similar feature called "reference style links", the
difference being that they can be defined anywhere in the document,
whereas asciidoc's "attribute entries" must precede their usage in
the text:
https://daringfireball.net/projects/markdown/syntax#link


Here's a v2, the only change is Bruno Pr=E9mont's addition to the commi=
t
message.

@Daniel Vetter: Could you pick this up for topic/drm-misc please?

An ack for drivers/platform/x86 was kindly provided by Darren Hart with=
:
Message-ID: <20160104203150.GA4219@malice.jf.intel.com>
Link: http://lists.freedesktop.org/archives/dri-devel/2016-January/0979=
18.html

Thanks everyone!


Lukas Wunner (1):
  apple-gmux: Add initial documentation

 Documentation/DocBook/gpu.tmpl    |  22 ++++++++
 drivers/platform/x86/apple-gmux.c | 113 ++++++++++++++++++++++++++++++=
++++++++
 2 files changed, 135 insertions(+)

--=20
1.8.5.2 (Apple Git-48)
