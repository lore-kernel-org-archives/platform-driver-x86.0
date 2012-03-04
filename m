From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 1/1] samsung-laptop: add N230 to supported models
Date: Sun, 4 Mar 2012 11:52:47 +0100
Message-ID: <CAHR064gbNSwHc=GVfm1R7LAmswJg_o7eW33cQ=JZHMJ8PMoVNw@mail.gmail.com>
References: <1330714505-13170-1-git-send-email-jslaby@suse.cz>
	<CA+5PVA7=rMwMdvL+jY6nXS-RD8CCTTug6XZ6fmdzwHeksi79aw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:52922 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752216Ab2CDKwt convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 4 Mar 2012 05:52:49 -0500
In-Reply-To: <CA+5PVA7=rMwMdvL+jY6nXS-RD8CCTTug6XZ6fmdzwHeksi79aw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Josh Boyer <jwboyer@gmail.com>
Cc: Jiri Slaby <jslaby@suse.cz>, mjg@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Mar 2, 2012 at 8:06 PM, Josh Boyer <jwboyer@gmail.com> wrote:
> On Fri, Mar 2, 2012 at 1:55 PM, Jiri Slaby <jslaby@suse.cz> wrote:
>> There is a version of N230 which has only this in product and board
>> names. See dmidecode in the bugzilla entry.
>>
>> Without this patch, one has to pass the force module parameter to ha=
ve
>> rfkill working.
>>
>> References: https://bugzilla.novell.com/show_bug.cgi?id=3D746695
>> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
>
> I think Corey has patches queued up in Matthew's git tree that drop t=
he DMI
> checks in this driver entirely. =C2=A0If so, this probably isn't need=
ed.

Right. You can try the out-of-tree module using this repository
https://github.com/iksaif/samsung-laptop-dkms . The patchs are in
Matthew queue and they should be merged in 3.4.

--=20
Corentin Chary
http://xf.iksaif.net
