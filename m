From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] eeepc-wmi: Add support for T101MT "Express Gate" key
Date: Thu, 24 Mar 2011 08:33:33 +0100
Message-ID: <AANLkTinZpt8qmHzhe4WyteMt-C-nkVNwEGQVvq3Nk9Lx@mail.gmail.com>
References: <1300909189-4135-1-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:65071 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933363Ab1CXHdf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 24 Mar 2011 03:33:35 -0400
In-Reply-To: <1300909189-4135-1-git-send-email-seth.forshee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 23, 2011 at 8:39 PM, Seth Forshee
<seth.forshee@canonical.com> wrote:
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
> ---
>
> This button is unusual. On press it emits scanocde 0xe4, on release
> 0xe5, and when held for a few seconds it begins emitting 0xea about
> twice per second. I chose to handle only the press event in order to
> make it behave like the other hotkeys.
>
> Probably the closest thing to the intended function of this button
> would be to alternate the display orientation between portrait and
> landscape, but since there doesn't appear to be a keycode defined for
> that function I went with KEY_PROG2. I'm open to other suggestions
> however.

Hi,
The manual says that under Windows, this is the "Home Key", so
KEY_HOME would be more appropriate.
Also, it would be great to preserve key up and key down informations
(sparse keymap have an "autorelease" parameter to control that).
Thanks,

-- 
Corentin Chary
http://xf.iksaif.net
