From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 06/15] samsung-laptop: add small debugfs interface
Date: Wed, 23 Nov 2011 07:27:35 +0100
Message-ID: <CAHR064i7sVOyGdhbSAj8gCeTqpYeGuJUd_q_=On+K8j32R9vEw@mail.gmail.com>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
	<1321999366-23784-7-git-send-email-corentincj@iksaif.net>
	<20111122222048.GF24283@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:38212 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758516Ab1KWG1h convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 23 Nov 2011 01:27:37 -0500
In-Reply-To: <20111122222048.GF24283@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org

On Tue, Nov 22, 2011 at 11:20 PM, Greg KH <gregkh@suse.de> wrote:
> On Tue, Nov 22, 2011 at 11:02:37PM +0100, Corentin Chary wrote:
>> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
>
> You should describe what the debugfs interface does please.
>
> I have an idea, and I like it a lot, but still, it would be nice to l=
et
> the others know :)
>
> Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
>

It's in the code:

+/*+ * samsung-laptop/ =C2=A0 =C2=A0- debugfs root directory+ * =C2=A0 =
f0000_segment
 =C2=A0- dump f0000 segment+ * =C2=A0 command =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0- current command+ *
data =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - current data+ * =C2=A0=
 d0, d1, d2, d3 =C2=A0 - data fields+ *
=C2=A0 call =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - call SABI using=
 command and data+ */
But maybe I should add it to the changelog and add an example on how to=
 use it.

But yeah, it was very useful for experimentation.

--=20
Corentin Chary
http://xf.iksaif.net
