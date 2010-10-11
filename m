From: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] eeepc-wmi: add additional hotkeys
Date: Mon, 11 Oct 2010 10:10:04 -0700
Message-ID: <201010111010.06057.dmitry.torokhov@gmail.com>
References: <1286761702-4304-1-git-send-email-chris@cnpbagwell.com>
	<AANLkTin3J3oOaYD8G=YSrBr0AKzw7mY7v0BQssw5z2Z6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <AANLkTin3J3oOaYD8G=YSrBr0AKzw7mY7v0BQssw5z2Z6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: yong.y.wang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Sunday, October 10, 2010 11:26:22 pm Corentin Chary wrote:
> On Mon, Oct 11, 2010 at 3:48 AM,  <chris-ZCD0YumhXB+iMFqZbmIluw@public.gmane.org> wrote:
> > From: Chris Bagwell <chris-ZCD0YumhXB+iMFqZbmIluw@public.gmane.org>
> > 
> > Added 4 hotkeys using same keymap values as eeepc-latop.
> > These are mousepad toggle, resolution change, screen off,
> > and task manager.  These were tested on 1005PE and are the
> > Fn-F3, F4, F7, and F9, respectively.
> > 
> > Also, added a new hot key for power toggles (Fn-Space on 1005PE)
> > and is meant to drive cpufv interface from userspace.
> > 
> > Finally, added several keys to be ignored that are being emitted
> > but do not mapped to any useful or documented hotkeys.  This is
> > purely cosmetic to prevent uknown key reports on console/log files.
> > These keys are reported on 1005PE's.
> 
> What are exactly these keys ? Since they are probably some obscure Fn+
> combo, and they are probably used on another model, I'm not sure we should
> hide them.
> 
> I'm still not happy with F13 for "disable touchpad" but I did the same
> for other laptops,
> and we don't have a key for that ATM.

The most sensible way would be to add one then. We just need to decide if
it should be a key or a switch.

-- 
Dmitry

------------------------------------------------------------------------------
Beautiful is writing same markup. Internet Explorer 9 supports
standards for HTML5, CSS3, SVG 1.1,  ECMAScript5, and DOM L2 & L3.
Spend less time writing and  rewriting code and more time creating great
experiences on the web. Be a part of the beta today.
http://p.sf.net/sfu/beautyoftheweb
