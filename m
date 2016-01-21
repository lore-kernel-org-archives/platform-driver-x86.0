From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] Remove logging for "Unsupported brightness interface"
Date: Thu, 21 Jan 2016 11:54:43 -0200
Message-ID: <1453384483.1258747.498568498.27762FC4@webmail.messagingengine.com>
References: <CANpvso6S3jH0qYoPRmoNAc7sCsRd4UkosfzXFBAuLLUuZaPKCw@mail.gmail.com>
 <CANpvso4NpQgTj2x-65PxXw3VEY2rMiMpP+qT2Xjbx9q_n1g0zg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:52285 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759566AbcAUNyo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Jan 2016 08:54:44 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 39C752095E
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Jan 2016 08:54:44 -0500 (EST)
In-Reply-To: <CANpvso4NpQgTj2x-65PxXw3VEY2rMiMpP+qT2Xjbx9q_n1g0zg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Eric Curtin <ericcurtin17@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ibm-acpi-devel@lists.sourceforge.net, Darren Hart <dvhart@infradead.org>, ibm-acpi@hmh.eng.br, Kernel development list <linux-kernel@vger.kernel.org>

On Thu, Jan 21, 2016, at 09:18, Eric Curtin wrote:
> On 16 January 2016 at 23:43, Eric Curtin <ericcurtin17@gmail.com> wrote:
> > Message gets logged on machines that are well supported.
> > Fixed one checkpatch.pl ERROR also.
> >
> > Signed-off-by: Eric Curtin <ericcurtin17@gmail.com>
> > ---
> >  drivers/platform/x86/thinkpad_acpi.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/platform/x86/thinkpad_acpi.c
> > b/drivers/platform/x86/thinkpad_acpi.c
> > index 0bed473..b149dec 100644
> > --- a/drivers/platform/x86/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/thinkpad_acpi.c
> > @@ -6434,7 +6434,7 @@ static const struct tpacpi_quirk
> > brightness_quirk_table[] __initconst = {
> >   */
> >  static void __init tpacpi_detect_brightness_capabilities(void)
> >  {
> > - unsigned int b;
> > + const unsigned int b = tpacpi_check_std_acpi_brightness_support();

This unrelated change can have side-effects, and I didn't stop to look
at the code yet to know if it is desired.  Regardless, it should be in a
separate patch anyway as it has nothing to do with the removal of the
log message, so please drop it.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
