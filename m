From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH] x86/uv/time: Replace one-element array and save heap space
Date: Mon, 18 May 2020 14:01:14 -0500
Message-ID: <20200518190114.GA7757@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "x86@kernel.org H. Peter Anvin" <hpa@zytor.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: platform-driver-x86.vger.kernel.org

The current codebase makes use of one-element arrays in the following
form:

struct something {
    int length;
    u8 data[1];
};

struct something *instance;

instance = kmalloc(sizeof(*instance) + size, GFP_KERNEL);
instance->length = size;
memcpy(instance->data, source, size);

but the preferred mechanism to declare variable-length types such as
these ones is a flexible array member[1][2], introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on. So, replace
the one-element array with a flexible-array member.

Also, make use of the new struct_size() helper to properly calculate the
total size needed to allocate dynamic memory for struct uv_rtc_timer_head.
Notice that, due to the use of a one-element array, space for an extra
struct cpu:

struct {
	int     lcpu;           /* systemwide logical cpu number */
	u64     expires;        /* next timer expiration for this cpu */
} cpu[1]

was being allocated at the moment of applying the sizeof operator to
struct uv_rtc_timer_head in the call to kmalloc_node() at line 159:

159		head = kmalloc_node(sizeof(struct uv_rtc_timer_head) +
160			(uv_blade_nr_possible_cpus(bid) *
161				2 * sizeof(u64)),
162			GFP_KERNEL, nid);

but that extra cpu[] was never actually being accessed due to the
following piece of code at line 168:

168		head->ncpus = uv_blade_nr_possible_cpus(bid);

and the piece of code at line 187:

187		for (c = 0; c < head->ncpus; c++) {
188			u64 exp = head->cpu[c].expires;
189			if (exp < lowest) {
190				bcpu = c;
191				lowest = exp;
192			}
193		}

so heap space was being wasted.

Another thing important to notice is that through the use of the
struct_size() helper, code at line 161:

161		2 * sizeof(u64)),

is changed to now be the actual size of struct cpu; see
sizeof(*(p)->member) at include/linux/overflow.h:314:

314 #define struct_size(p, member, n)                                       \
315         __ab_c_size(n,                                                  \
316                     sizeof(*(p)->member) + __must_be_array((p)->member),\
317                     sizeof(*(p)))

As a side note, the original developer could have implemented code at line
161: 2 * sizeof(64) as follows:

sizeof(*head->cpu)

This issue has been out there since 2009.

This issue was found with the help of Coccinelle and fixed _manually_.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 arch/x86/platform/uv/uv_time.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/platform/uv/uv_time.c b/arch/x86/platform/uv/uv_time.c
index 7af31b245636..993a8ae6fdfb 100644
--- a/arch/x86/platform/uv/uv_time.c
+++ b/arch/x86/platform/uv/uv_time.c
@@ -52,7 +52,7 @@ struct uv_rtc_timer_head {
 	struct {
 		int	lcpu;		/* systemwide logical cpu number */
 		u64	expires;	/* next timer expiration for this cpu */
-	} cpu[1];
+	} cpu[];
 };
 
 /*
@@ -156,9 +156,8 @@ static __init int uv_rtc_allocate_timers(void)
 		struct uv_rtc_timer_head *head = blade_info[bid];
 
 		if (!head) {
-			head = kmalloc_node(sizeof(struct uv_rtc_timer_head) +
-				(uv_blade_nr_possible_cpus(bid) *
-					2 * sizeof(u64)),
+			head = kmalloc_node(struct_size(head, cpu,
+				uv_blade_nr_possible_cpus(bid)),
 				GFP_KERNEL, nid);
 			if (!head) {
 				uv_rtc_deallocate_timers();
-- 
2.26.2
