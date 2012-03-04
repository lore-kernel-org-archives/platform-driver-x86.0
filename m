From: Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH 1/1] samsung-laptop: add N230 to supported models
Date: Sun, 04 Mar 2012 14:40:29 +0100
Message-ID: <4F5370CD.3000501@suse.cz>
References: <1330714505-13170-1-git-send-email-jslaby@suse.cz> <CA+5PVA7=rMwMdvL+jY6nXS-RD8CCTTug6XZ6fmdzwHeksi79aw@mail.gmail.com> <CAHR064gbNSwHc=GVfm1R7LAmswJg_o7eW33cQ=JZHMJ8PMoVNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:44203 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754269Ab2CDNke (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 4 Mar 2012 08:40:34 -0500
In-Reply-To: <CAHR064gbNSwHc=GVfm1R7LAmswJg_o7eW33cQ=JZHMJ8PMoVNw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Josh Boyer <jwboyer@gmail.com>, Jiri Slaby <jirislaby@gmail.com>, mjg@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/04/2012 11:52 AM, Corentin Chary wrote:
> On Fri, Mar 2, 2012 at 8:06 PM, Josh Boyer <jwboyer@gmail.com> wrote:
>> On Fri, Mar 2, 2012 at 1:55 PM, Jiri Slaby <jslaby@suse.cz> wrote:
>>> There is a version of N230 which has only this in product and board
>>> names. See dmidecode in the bugzilla entry.
>>>
>>> Without this patch, one has to pass the force module parameter to have
>>> rfkill working.
>>>
>>> References: https://bugzilla.novell.com/show_bug.cgi?id=746695
>>> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
>>
>> I think Corey has patches queued up in Matthew's git tree that drop the DMI
>> checks in this driver entirely.  If so, this probably isn't needed.
> 
> Right. You can try the out-of-tree module using this repository
> https://github.com/iksaif/samsung-laptop-dkms . The patchs are in
> Matthew queue and they should be merged in 3.4.

Ok, thanks. Then please merge with -next ASAP.

-- 
js
suse labs
