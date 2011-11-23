From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 14/15] samsung-laptop: dump model and version informations
Date: Wed, 23 Nov 2011 07:37:57 +0100
Message-ID: <CAHR064hc3JBExbTCSwSycco_Ga8=mBVf3vkDhzGO8Deap7fGCQ@mail.gmail.com>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
	<1321999366-23784-15-git-send-email-corentincj@iksaif.net>
	<20111122222809.GN24283@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:63283 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753400Ab1KWGh7 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 23 Nov 2011 01:37:59 -0500
In-Reply-To: <20111122222809.GN24283@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org

On Tue, Nov 22, 2011 at 11:28 PM, Greg KH <gregkh@suse.de> wrote:
> On Tue, Nov 22, 2011 at 11:02:45PM +0100, Corentin Chary wrote:
>> We still need to figure out exactly what each of different fields
>> represent, but they contain at least model and version informatiosn.
>>
>> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
>
> For every time the driver loads? =C2=A0That's not nice, how about put=
ting
> this into debugfs instead?

Ok, why not.

--=20
Corentin Chary
http://xf.iksaif.net
